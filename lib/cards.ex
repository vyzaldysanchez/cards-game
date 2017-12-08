defmodule Cards do
    @moduledoc """
        Provides methods to create and handle a deck of cards
    """
    
    @doc """
        Returns a list of strings which represent a deck of cards
    """
    def create_deck do
        values = ["Ace", "Two", "Three", "Four", "Five"] 
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

        for suit <- suits, value <- values do
            "#{value} of #{suit}"
        end
    end

    def shuffle(deck) do
        Enum.shuffle(deck)
    end

    def contains?(deck, card) do
        Enum.member?(deck, card)
    end

    @doc """
        Divides a deck into a hand and the reminder of the deck.
        The hand_size argument indicates how many cards should be in the hand.

    ## Examples
    
        iex> deck = Cards.create_deck
        iex> {hand, _} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

    """
    def deal(deck, hand_size) do
        Enum.split(deck, hand_size)
    end

    def save(deck, file_name) do
        # Turns the deck object into binary so that can be read and saved in the file system
        binary = :erlang.term_to_binary(deck)
        File.write(file_name, binary)
    end

    def load(file_name) do
        case File.read(file_name) do
            {:ok, binary} -> :erlang.binary_to_term(binary)
            {:error, _} -> "The file #{file_name} does not exists."
            _ -> "Nothing happens yet, but we could not load your file."
        end
    end

    def create_hand(hand_size) do
        create_deck() |> shuffle |> deal(hand_size) 
    end

end
