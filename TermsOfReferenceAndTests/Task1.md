У вас есть текст программы в формате txt, суть которой в том, чтобы цикле выводить результат сложения 1 + 1. Ее необходимо создать самостоятельно, в начале файла обязательно должен быть указан комментарий #TEMPLATE. Также отдельной строкой комментарий с номером версии, например, 1.0.5


Необходимо создать установочный файл.

Установка должна вызываться следующей командой:

file_name.bash program_file_name


file_name.bash - название и/или путь до вашего установочного файла

program_file_name - наименование файла с программой


Установочный файл должен выполнять следующие действия:

1) Проверить наличие файла программы. Если его нет, то вывести соответствующую ошибку (например, No program file), выполнение программы завершить.
2) Проверить, есть ли в названии файла запрещённые символы (например, буквы или любые другие, на усмотрение студента). Если есть, то вывести соответствующую ошибку (например, No program file), выполнение программы завершить.
3) Создать копию файла программы в формате .sh. Удалить комментарий #TEMPLATE
4) Обеспечить возможность отмены пользователем действий установщика с откатом изменений, сделанных скриптом.