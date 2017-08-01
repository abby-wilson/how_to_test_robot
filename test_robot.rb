require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_neeing_repairs_sent_to_station_1
    # arrange
      broken_robot = Robot.new
      broken_robot.needs_repairs = true
      broken_robot.foreign_model = true
    # act
    result = broken_robot.station

    # assert
    assert_equal(result, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = true
    broken_robot.vintage_model = true
    # act
      result = broken_robot.station
    # assert

      assert_equal(result, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = true
    # act
    result = broken_robot.station
    # assert
    assert_equal(result, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    broken_robot = Robot.new

    # act
    result = broken_robot.station
    # assert
    assert_equal(result, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
      todo = Robot.new
    # act
      result = todo.prioritize_tasks

    # assert
    assert_equal(result, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
      todo = Robot.new
      todo.todos = [1, 2, 3, 4, 5, 6]
    # act
      result = todo.prioritize_tasks
    # assert
      assert_equal(result, 6)
  end

  def test_workday_on_day_off_returns_false

    # arrange
      working_robot = Robot.new
      working_robot.day_off= 'Friday'
    # act
      result = working_robot.workday?('Thursday')
    # assert
      assert_equal(result, true)
  end

  def test_workday_not_day_off_returns_true

    # arrange
      working_robot = Robot.new
      working_robot.day_off= 'Friday'
    # act
      result = working_robot.workday?('Friday')
    # assert
      assert_equal(result, false)
  end

end
