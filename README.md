# ITMO-Operational-Systems-labs-4-sem

# [Labs](#lab-1) |  [Tests](#test-1)
| Labs  (1-3)        | Labs (4-6)   | Tests (1-3)         | Tests (4-6)     |
|---------------|----------------|---------------|----------------|
| [lab 1](#lab-1) | [lab 4](#lab-4) | [test 1](#test-1) | [test 4](#test-4) |
| [lab 2](#lab-2) | [lab 5](#lab-5) | [test 2](#test-2) | [test 5](#test-5) |
| [lab 3](#lab-3) | [lab 6](#lab-6) | [test 3](#test-3) | [test 6](#test-6) |




## Lab 1

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab1.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task1.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab1.pdf)

## Lab 2

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab2.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task2.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab2.pdf)

## Lab 3

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab3.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task3.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab3.pdf)

## Lab 4

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab4.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task4.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab4.pdf)

## Lab 5

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab5.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task5.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab5.pdf)

## Lab 6

### [task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab6.md)
### [Extra task](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Task6.md)
### [manual](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/blob/main/TermsOfReferenceAndTests/Lab6.pdf)

## Test 1

### 1. Перечислите основные функции программ-диспетчеров - предшественников операционных систем на этапе однопрограммной пакетной обработки
   
Лекция:
- Повторное использование кода, линковки и загрузки
- Оптимизация хранения системы ввода/вывода
- Прерывание
- Однопрограммная пакетная обработка???
  
Файл со Studfiles:

- Автоматизация линковки (связи приложений с ячейками памяти)
- Оптимизация взаимодействия с устройствами ввода/вывода

### 2. Перечислите основные фукнции операционных систем, появившихся на этапе мультипрограммной обработки
     
Вроде бы лекция:
- Разделение процессорного времени
(processor sharing)
- Виртуальная память
- Защита памяти
- Планирование комплексного использования ресурсов
- Универсальный доступ к информации на внешних устройствах
- Обеспечение коммуникации между программами

  Файл со Studfiles:
   1. Разделение времени между программы привело к созданию таймера и смене контекста, выполнения нескольких программ.
   2. Виртуализация памяти: только ОС имеет право писать физические адреса памяти, ПО может работать только с выделенной памятью.
   3. Системные вызовы - обращение программного обеспечения к операционной системе с просьбой предоставить какие-либо возможности.
   4. Мульти планирование времени
   5. Синхронизация и коммуникация между программами
   6. Разделение доступа к внешней информации, файлам

### 3. Дайте определение или объясните сущность механизма
"системный вызов"
Лекция:
Системный вызов - обращение пользователей программы к ядру ОС с просьбой предоставить дополнительный ресурс или выполнить привелигированную операцию

### 4. Дайте определение или объясните сущность механизма
"прерывание"
Лекция:
Прерывание - сигнал, поступающий от внешнего устройства к центральному процессору, сообщающий о наступлении определенного события, приостанавливающий выполнение текущего потока команд и передающий управление подпрограмме-обработчику прерывани
Файл со Studfiles:
Прерывание - специальный сигнал, который останавливает центральный процесс и заставляет переключиться с одной задачи на другую.

### 5. Дайте определение или объясните сущность механизма
"виртуальная память"
Лекция:
Виртуальная память - абстракция, позволяющая при создании или компиляции программы использовать адреса, отсчитываемые от нуля, а при исполнении заменять их на физические
Файл со Studfiles:
Виртуальная память - это явление когда часть физической памяти выделяется для определенного процесса и ее адреса для данного процесса преобразуются в новые, начинающиеся с нуля

### 6. Дайте определение понятия
"Операционная система"
Файл со Studfiles:
Операционная система - базовое системное программное обеспечение, управляющее работой компьютера и являющееся интерфейсом между аппаратурой, прикладным программным обеспечением и пользователем.

## Test 2

### 1. Перечислите основные цели работы современной ОС

Лекция:

Обеспечить производительность, надежность и безопасность исполнения пользовательского программного обеспечения, эксплуатация пользовательского ПО, хранение и доступ к данным и диалог с пользователем

### 2. Задачи, которые решает ОС в рамках организации интерфейса между пользовательскими приложениями и аппаратным обеспечением

- Управление исполнением программы
- Обнаружение и обработка ошибок
- Высокоуровневый доступ к устройствам ввода/вывода
- Управление хранилищем данных
- Мониторинг ресурсов

### 3. Основной принцип обеспечения ОС эффективного использования ресурсов (PDCA)

PDCA - адаптивное управление

![image](https://github.com/DmitryVasilkovW/ITMO-Operational-Systems-labs-4-sem/assets/113594620/21562310-d8f0-45f3-918b-6bc0c84e9110)

### 4. Какие основные механизмы используются под системой управления процессами

- Дескрипторы процессов, PCD
- Планировщик

### 5. Какие основные механизмы используются подсистемой управления файлами?

- Преобразование имен
- Каталоги

### 6. Два основых способа реализации пользовательского интерфейса в системе

- CLI - Command Line Interface
- GUI - Graphic User Interface


