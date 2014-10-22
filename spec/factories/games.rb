# Read about factories at https://github.com/thoughtbot/factory_girl

# Used sequence to generate unique info, for example to populate with multiple games in the test
FactoryGirl.define do
  factory :game do
    sequence (:superbowl) {|i| 1 + i }
    sequence (:winner) {|i| "winner#{i}"}
    winscore 14
    sequence (:opponent) {|i| "opponent#{i}"}
    oppscore 7
    gamedate "2014-09-03"
  end
  
  factory :invalid_game, class:Game do
    superbowl nil
    winner nil
    winscore nil
    opponent nil
    oppscore nil
    gamedate nil
  end
  
end
