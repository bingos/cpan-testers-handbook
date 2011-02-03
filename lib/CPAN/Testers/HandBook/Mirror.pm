package CPAN::Testers::HandBook::Mirror;

#ABSTRACT: The CPAN Testers Handbook: Mirror

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

Once you have your first sync, a simple C<cron> job can be used to keep the mirror up to date.

=head1 CPAN::Mini Mirror

L<CPAN::Mini> can build a minimal local CPAN mirror containing only those files needed to install 
the newest version of every distribution on CPAN.

For CPAN Testing there are subclasses of L<CPAN::Mini> available, L<CPAN::Mini::Devel> and
L<CPAN::Mini::Devel::Recent>. These subclasses enhance L<CPAN::Mini> to include the latest developer 
and non-developer releases in the mirror.

  $ minicpan -c CPAN::Mini::Devel -l /home/ftp/CPAN/ -r http://mirrors3.kernel.org/mirrors/CPAN/

Once you have your first sync, a simple C<cron> job can be used to keep the mirror up to date.

=head1 Serving a mirror

If your local mirror is available to your smokers on a file system, either on the same server
or a networked file system such as NFS or SMB, you can use C<file://> urls in your smoker
configurations.

Otherwise you will require a HTTP and/or FTP server to provide remote access to your local mirror.

The installation and configuration of a suitable server is outside the scope of this document,
but some considerations follow:

=over

=item FTP access be anonymous

Any FTP server that is installed should provide C<anonymous> access to the local CPAN mirror.

=back

=cut
