**1. Хеш: aefead2207ef7e2aa5dc81a34aedf0cad4c32545<br /> Комментарий: Update CHANGELOG.md<br />** *команда  git grep aefea <br />*
**2. Тег: (tag: v0.12.23),<br />** *команда git show 85024d3<br />*
**3. У хеша b8d720 2 родителя - 56cd7859e05c36c06b56d013b55a252d0bb7e158, 9ea88f22fc6269854151c571162c5bcf958bee2b<br />**
*команда git show b8d720^ - git show b8d720^2 или git cat-file -p b8d720<br />*
**4. 33ff1c03bb960b332be3af2e333462dde88b279e Комментарий: v0.12.24,<br />
Хеш: b14b74c4939dcab573326f4e3ee2a62e23e12f89 Комментарий: [Website] vmc provider links,<br />
Хеш: 3f235065b9347a758efadc92295b540ee0a5e26e Комментарий: Update CHANGELOG.md,<br />
Хеш: 6ae64e247b332925b872447e9ce869657281c2bf Комментарий: registry: Fix panic when server is unreachable<br />
Хеш: 5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 Комментарий: website: Remove links to the getting started guide's old location<br />
Хеш: 06275647e2b53d97d4f0a19a0fec11f6d69820b5 Комментарий: Update CHANGELOG.md<br />
Хеш: d5f9411f5108260320064349b757f55c09bc4b80 Комментарий: command: Fix bug when using terraform login on Windows<br />
Хеш: 4b6d06cc5dcb78af637bbb19c198faff37a066ed Комментарий: Update CHANGELOG.md<br />
Хеш: dd01a35078f040ca984cdd349f18d0b67e486c35 Комментарий: Update CHANGELOG.md<br />
Хеш: 225466bc3e5f35baa5d07197bbc079345b77525e Комментарий: Cleanup after v0.12.23 release<br />**
*команда: git log v0.12.23..v0.12.24 --pretty=oneline<br />*
**5. Хеш в котором была создана функция func providerSource: 5af1e6234ab6da412fb8637393c5a17a1b293663<br />**
*команда: git log -S 'func providerSource' и git show 8c928e<br />*
**6. Хеш: 78b12205587fe839f10d946ea3fdc06719decb05<br />**
*Находим где была затронута функция - команда: git grep 'globalPluginDirs', нашли файл где добавлена искомая функция и<br />
выполняем поиск изменения тела функции git log -L :'globalPluginDirs(':plugins.go<br />*
**7.Автор функции: Martin Atkins<br />**
*команда: git log -S 'synchronizedWriters' и смотрим коммит  git show  5ac311e2a9*
