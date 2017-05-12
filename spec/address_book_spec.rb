require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) {
    AddressBook.new
  }

  describe 'attributes' do
    it 'responds to entries' do
      expect(book).to respond_to(:entries)
    end

    it 'initializes entries as an array' do
      expect(book.entries).to be_an(Array)
    end

    it 'initializes entries as empty' do
      expect(book.entries.size).to eq(0)
    end
  end

  describe '#add_entry' do
    it 'adds only 1 entry to address book' do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it 'adds correct information to entries' do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry=book.entries[0]

      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end


  describe '#remove_entry' do
    it 'removes 1 entry from the address book' do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(0)
    end
  end


#we assume that there are 5 entries in AddressBook
  describe '#import_from_csv' do

    it 'imports the correct number of entries' do
      book.import_from_csv('entries.csv')
      book_size=book.entries.size
      expect(book_size).to eq 5
    end

    it 'imports the 1st entry' do
      book.import_from_csv('entries.csv')
      entry_one=book.entries[0]
      expect(entry_one.name).to eq 'Bill'
      expect(entry_one.phone_number).to eq '555-555-4854'
      expect(entry_one.email).to eq 'bill@blocmail.com'
    end

    it 'imports the 2nd entry' do
      book.import_from_csv('entries.csv')
      # Check the second entry
      entry_two = book.entries[1]
      expect(entry_two.name).to eq 'Bob'
      expect(entry_two.phone_number).to eq '555-555-5415'
      expect(entry_two.email).to eq 'bob@blocmail.com'
    end

    it 'imports the 3rd entry' do
      book.import_from_csv('entries.csv')
      # Check the third entry
      entry_three = book.entries[2]
      expect(entry_three.name).to eq 'Joe'
      expect(entry_three.phone_number).to eq '555-555-3660'
      expect(entry_three.email).to eq 'joe@blocmail.com'
    end

    it 'imports the 4th entry' do
      book.import_from_csv('entries.csv')
      # Check the fourth entry
      entry_four = book.entries[3]
      expect(entry_four.name).to eq 'Sally'
      expect(entry_four.phone_number).to eq '555-555-4646'
      expect(entry_four.email).to eq 'sally@blocmail.com'
    end

    it 'imports the 5th entry' do
      book.import_from_csv('entries.csv')
      # Check the fifth entry
      entry_five = book.entries[4]
      expect(entry_five.name).to eq 'Sussie'
      expect(entry_five.phone_number).to eq '555-555-2036'
      expect(entry_five.email).to eq 'sussie@blocmail.com'
    end


    it 'imports 1st entry from entries_2.csv' do
      book.import_from_csv('entries_2.csv')
      entry_one=book.entries[0]
      expect(entry_one.name).to eq 'Billy'
      expect(entry_one.phone_number).to eq '555-500-4854'
      expect(entry_one.email).to eq 'billy@blocmail.com'
    end


    it 'imports 1st entry from entries_2.csv' do
      book.import_from_csv('entries_2.csv')
      entry_two=book.entries[1]
      expect(entry_two.name).to eq 'Bobby'
      expect(entry_two.phone_number).to eq '555-555-5015'
      expect(entry_two.email).to eq 'bobby@blocmail.com'
    end


    it 'imports 1st entry from entries_2.csv' do
      book.import_from_csv('entries_2.csv')
      entry_three=book.entries[2]
      expect(entry_three.name).to eq 'Joeye'
      expect(entry_three.phone_number).to eq '555-555-3000'
      expect(entry_three.email).to eq 'joeye@blocmail.com'
    end

  end

end








