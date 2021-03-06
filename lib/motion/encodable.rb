class Motion
  module Encodable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def properties(*props)
        @properties = []
        props.each {|prop|
          @properties << prop
        }
      end

      def load(data)
        NSKeyedUnarchiver.unarchiveObjectWithData(data)
      end
    end

    def properties
      self.class.instance_variable_get(:'@properties')
    end

    def to_data
      NSKeyedArchiver.archivedDataWithRootObject(self)
    end
    
    def save_to_file(path)
      NSKeyedArchiver.archiveRootObject(self, toFile: path)
    end

    # NSCoding protocol
    def initWithCoder(decoder)
      self.init
      properties.each {|prop|
        v = decoder.decodeObjectForKey(prop.to_s)
        self.instance_variable_set(:"@#{prop}", v) if v
      }
      self
    end

    def encodeWithCoder(encoder)
      properties.each {|prop|
        encoder.encodeObject(self.instance_variable_get(:"@#{prop}"), forKey: prop.to_s)
      }
    end
    # // NSCoding protocol
  end
end

