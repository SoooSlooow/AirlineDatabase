# БД авиакомпании
БД содержит 7 таблиц:
1) *Flight* - информация о рейсах:
  * *id* - идентификатор полета (INT);
  * *route_id* - идентификатор маршрута, по которому совершается полет (INT);
  * *departure_date* - дата вылета (DATE).
2) *Route* - информация о маршрутах:
  * *id* - идентификатор маршрута (INT);
  * *time_out* - время вылета (TIME);
  * *time_in* - время прилета (если значение превышает 24 часа, то прилет осуществляется на следующие сутки после вылета) (TIME);
  * *city_out* - город вылета (VARCHAR(20));
  * *city_in* - город прилета (VARCHAR(20));
  * *plane_id* - идентификатор самолета, осуществляющего полет по данному маршруту (INT).
3) *Plane* - информация о самолетах:
  * *id* - идентификатор самолета (INT);
  * *model* - модель самолета (VARCHAR(20));
  * *manufacturing_date* - дата изготовления (DATE).
4) *PlaneModelData* - информация о моделях самолетов:
  * *model* - модель самолета (VARCHAR(20));
  * *length* - длина (FLOAT(4, 2));
  * *span* - размах крыльев (FLOAT(4, 2));
  * *capacity* - вместимость (SMALLINT).
5) *Employee* - информация о сотрудниках:
  * *id* - идентификатор сотрудника (INT);
  * *route_id* - идентификатор маршрута, на котором работает сотрудник (INT);
  * *first_name* - имя (VARCHAR(20));
  * *last_name* - фамилия (VARCHAR(20));
  * *position* - должность (VARCHAR(20));
  * *start_date* - дата вступления в должность (DATE).
6) *Passenger* - информация о пассажирах:
  * *id* - идентификатор пассажира (INT);
  * *first_name* - имя (VARCHAR(20));
  * *sex* - пол ('M' - мужской, 'F' - женский);
  * *birthday* - дата рождения (DATE);
  * *passport* - серия и номер паспорта (CHAR(11)).
7) *Ticket* - информация о билетах:
  * *id* - идентификатор билета (INT);
  * *flight_id* - идентфикатор рейса, на который приобретен билет (INT);
  * *class* - класс билета ('economy' - эконом, 'business' - бизнесс);
  * *place* - номер места (VARCHAR(20));
  * *luggage* - наличие багажа ('yes' - да, 'no' - нет).