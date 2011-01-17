package CPAN::Testers::HandBook::Mirror;

#ABSTRACT: The CPAN Testers Handbook

use strict;
use warnings;

qq[Built by nutters, driven by robots];

=pod

=head1 DESCRIPTION

Running CPAN Testing infrastructure really requires a local CPAN mirror of some sort.

If you are running several C<smokers> over the same Internet link, a local CPAN mirror
will reduce the amount of network traffic over your link.

There are two primary ways to build a local mirror, either a full CPAN mirror or L<CPAN::Mini>
based mirror.

=head1 FULL Mirror

A full CPAN mirror will have everything that is available on CPAN at the expense of disk space.

  $ date
  Mon Jan 17 21:38:33 GMT 2011

  $ du -sh /home/ftp/CPAN/
  7.8G    /home/ftp/CPAN/

To obtain a full mirror is relatively straight forward. Pick an location on a disk where you
want to create the mirror, select a CPAN mirror that offers C<rsync> access, run C<rsync> to
create the mirror.

The first sync can be from any mirror that offers C<rsync> as long as it is reasonably up to date.
Subsequent synchronisation should be from one of the C<fast> CPAN mirrors.

  $ rsync -av --no-owner --delete --exclude "authors/.FRMRecent-RECENT*" \ 
    --delete-excluded rsync://mirrors3.kernel.org/mirrors/CPAN/ /home/ftp/CPAN/ \
    2>&1 | tee sync.log



=head1 CPAN::Mini Mirror

=head1 Serving a mirror

=cut
