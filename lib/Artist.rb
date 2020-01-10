class Artist 
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
        @songs = []
    end

    def self.all 
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save 
        @@all << self
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save 
        new_artist
    end

    def add_song(song)
        if song.artist == nil 
            song.artist = self
        end
        if self.songs.include?(song)
        else 
            self.songs << song
            
        end
    end


    def genres 
        self.songs.map{|song| song.genre}.uniq
    end


end
