class Song 
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist
        self.genre = genre
        @@all = []
        
    end
    
    def artist=(artist)
        if artist == nil 
            @artist = artist 
        else
            @artist = artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
        if genre == nil 
            @genre = genre 
         else
            @genre = genre 
            if genre.songs.include?(self)
            else
                genre.songs << self
            end
         end
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
        new_song = self.new(name)
        new_song.save 
        new_song
    end

    def self.find_by_name(song_name)
        @@all.detect{|song| song.name == song_name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) 
            self.name 
        
        else
            self.create(name)
        end

    end


end
