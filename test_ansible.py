"""
Unit tests module for this project
Just run like this :
export PYTHONPATH=/home/toto/ansible ; cd ~/ansible ; venv ; python test_ansible.py
"""

import unittest

class TestUtils(unittest.TestCase):
        
    def Test_assert_equals(self,p1,p2):
        self.assertEqual(p1,p2)
       
    def test_fake_test(self):        
        self.Test_assert_equals(1,1)


if __name__ == "__main__":
    #unittest.main()
    exit
