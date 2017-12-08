defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck = Cards.create_deck()

    assert Kernel.length(deck) === 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()

    refute deck == Cards.shuffle(deck)
  end

  test "contains? validates a card existence in the deck" do
    deck = Cards.create_deck()

    assert Cards.contains?(deck, "Ace of Spades") === true
    assert Cards.contains?(deck, "Ace of Blades") === false
  end


end
