Новые политики безопасности вашей компании запрещают использование сторонних репозиториев и git. Ваша команда не намерена отказываться от такого удобного инструмента и решает воспользоваться возможностью для создания программы с похожими функциями. Вам поручают создать MVP (минимальный работоспособный продукт, очень урезанная версия ПО, нужен для быстрой оценки идеи) по следующим требованиям:


Скрипту передается путь к файлу и команда.
- Если команда check
1. Проверяется есть ли скрытая папка в текущей директории ./as_git (название по усмотрению студента). Если нет, то создаётся.
2. Если в папке ./as_git есть переданный файл, то они сравниваются и результаты сравнения записываются в файл ФАЙЛ_НЕЙМ.log.
3. Если файла нет - то он создаётся.
- Если команда Recover.
1. Удалить переданный файл. 
2. Создать жесткую ссылку на существующий файл из ./as_git вместо удаленного.
