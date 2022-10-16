#
# ssh.mk - Makefile for SSH setup
#

PERSONAL_KEY:="$(HOME)/.ssh/id_ed25519"
WORK_KEY:="$(HOME)/.ssh/id_ed25519_work"
HOSTNAME:=$(shell hostname -s)

ssh_keys: $(PERSONAL_KEY) $(WORK_KEY)						## Setup SSH Keys

$(PERSONAL_KEY):
		[ -f $(WORK_KEY) ] || ssh-keygen -t ed25519 -f $(PERSONAL_KEY) -C "$(HOSTNAME)"
			ssh-add $(PERSONAL_KEY)

$(WORK_KEY):
		[ -f $(WORK_KEY) ] || ssh-keygen -t ed25519 -f $(WORK_KEY) -C "$(HOSTNAME)-work"
			ssh-add $(WORK_KEY)
