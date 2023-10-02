import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_nodejs_version8(host):
    ansible_vars = host.ansible.get_variables()
    nodejs_version = "v" + ansible_vars.get('nodejs_version8')
    nodejs_output = host.file("/opt/nvm/versions/node").listdir()
    assert str(nodejs_version) in nodejs_output


def test_nodejs_version12(host):
    ansible_vars = host.ansible.get_variables()
    nodejs_version = "v" + ansible_vars.get('nodejs_version12')
    nodejs_output = host.file("/opt/nvm/versions/node").listdir()
    assert str(nodejs_version) in nodejs_output
