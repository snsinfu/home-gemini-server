SSH_KEY = ~/.ssh/id_rsa
SSH_ADMIN = root@gemini

TEMPLATE_TARGETS = \
  config/hostapd.conf

ARTIFACTS =     \
  _provision.ok \
  $(TEMPLATE_TARGETS)

TEMPLATE_RULES = \
  -e "s/{{AP_SSID}}/$${AP_SSID}/g"


.PHONY: default clean ssh
.SUFFIXES: .in

default: _provision.ok
	@:

clean:
	rm -f $(ARTIFACTS)

ssh:
	ssh -i $(SSH_KEY) $(SSH_ADMIN)

_provision.ok: provision.sh config/*
	scp -i $(SSH_KEY) -pr provision.sh config $(SSH_ADMIN):
	ssh -i $(SSH_KEY) $(SSH_ADMIN) ./provision.sh
	@touch $@

_provision.ok: $(TEMPLATE_TARGETS)

.in:
	source .env; sed $(TEMPLATE_RULES) $< > $@
