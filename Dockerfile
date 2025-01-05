FROM ubuntu:24.04

WORKDIR /pre-commit-hooks

RUN apt update &&  apt install  -y --no-install-recommends ca-certificates git php-cli php-xmlwriter && apt clean

RUN git clone --depth 1 --branch 3.11.2 https://github.com/PHPCSStandards/PHP_CodeSniffer.git

RUN echo "#!/bin/bash\nphp /pre-commit-hooks/PHP_CodeSniffer/bin/phpcs \"\$@\"" >> /usr/bin/phpcs && chmod +x /usr/bin/phpcs
RUN echo "#!/bin/bash\nphp /pre-commit-hooks/PHP_CodeSniffer/bin/phpcbf \"\$@\"" >> /usr/bin/phpcbf && chmod +x /usr/bin/phpcbf
