require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
    context "after adding some entries" do
        it "Returns a list of entries added" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.all).to eq [diary_entry_1, diary_entry_2]
        end
        
    describe "#count_words" do
         it "it counts all the words in diary entries contents" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.count_words).to eq 5
         end
    end

    describe "#reading time" do
        it "fails if the wpm is zero" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
            diary.add(diary_entry_1)
            expect { diary.reading_time(0) }.to raise_error ("WPM must be positive")
        end

        it "it calculates the reading time for all entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
         end

        it "it calculates the reading time for all entries where its over a minute" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contents")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end
    end

    describe "find best entry reading time" do
        context "when there is one entry that is readable in the time"
            it "returns that entry" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title", "my contents 1")
                diary.add(diary_entry_1)
                result = diary.find_best_entry_for_reading_time(2,1)
                expect(result).to eq diary_entry_1
            end
        end
    end
end