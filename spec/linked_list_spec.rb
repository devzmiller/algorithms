require 'rspec'
require_relative '../linked_list'

describe LinkedList do
  let(:list) { LinkedList.new(4) }

  describe 'attributes' do
    it 'sets the head to the value it is intialized with' do
      expect(list.head.val).to eq 4
    end
  end

  describe '#add_node' do
    it 'sets @head.next to a new node with the given value' do
      list.add_node(2)
      expect(list.head.next.val).to eq 2
    end
  end

  describe '#add_nodes' do
    it 'adds multiple nodes to the list' do
      list.add_nodes([4,5,6,7])
      expect(list.return_list).to eq "4->4->5->6->7"
    end
  end

  describe '#return_list' do
    it 'prints the list in array form' do
      list.add_node(2)
      expect(list.return_list).to eq "4->2"
    end
  end

  describe '#delete_duplicates' do
    it 'removes any duplicate values from the list' do
      list.add_nodes([4,4,6,7,6,5,5])
      expect(list.delete_duplicates.return_list).to eq "4->6->7->5"
    end
  end

end
