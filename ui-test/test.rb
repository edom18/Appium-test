require 'rspec'
require 'selenium-webdriver'

APP_PATH = '../build/Release-iphonesimulator/Appium-test.app'

def absolute_app_path
    file = File.join(File.dirname(__FILE__), APP_PATH)
    raise "App doesn't exist #{file}" unless File.exist? file
    file
end

desired_caps = {
  'browserName' => '',
  'platform' => 'Mac',
  'device' => 'iPhone Simulator',
  'version' => '7.1',
  'app' => absolute_app_path
}

server_url = "http://127.0.0.1:4723/wd/hub"

describe "Computation" do
  before :all do
    @driver = Selenium::WebDriver.for(:remote, :desired_capabilities => desired_caps, :url => server_url)
    @driver.manage.timeouts.implicit_wait = 10 # seconds
   end

  after :all do
    @driver.quit
  end

  it "should add two numbers" do
    #button = @driver.find_element :class_name, 'UIAButton'
    #button = @driver.find_element :xpath, '//window[1]/button[1]'
    #button.click

    #element = @driver.find_elements(:xpath, '//UIAElement[2]')
    element = @driver.find_elements(:xpath, '//*')

    puts element.length
    puts '--------------'
    #element.each { |e|
    #    puts "size: #{e.size}\ntag_name: #{e.tag_name}\ntext: #{e.text}\nto_json: #{e.to_json}"
 
    #}
    #puts element
    puts '--------------'

    #element.tap
    
    testview = @driver.find_element :id, "testview"
    puts "size: #{testview.size}\ntag_name: #{testview.tag_name}\ntext: #{testview.text}\nto_json: #{testview.to_json}"

    testview.click

    @driver.alert_accept

    sleep 3
    #element.send_keys 'abcde'
  end

end
