class RandomTask
    def self.generate
        new.generate
    end

    def generate
        create_task
    end

    private

    def noun
        @noun ||= JSON.parse(request_noun).first
    end

    def action
        @action ||= ['buy a', 'put away the', 'research into a', 'draw a picture of a'].sample
    end

    def request_noun
        Faraday.send(:get, 'https://random-word-form.repl.co/random/noun').body
    end

    def description
        "Make sure you #{action} #{noun}."
    end

    def create_task
        Todo.create(task: noun.titleize, description: description)
    end
end