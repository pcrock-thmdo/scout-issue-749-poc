from django.http import HttpResponse
from poc.models import Person
from psycopg2 import sql


def index(request):
    name = "Phil"
    composed_query = sql.SQL(
        """
        SELECT * FROM poc_person
        WHERE {first_name_field} = %s
        """
    ).format(
        first_name_field = sql.Identifier("first_name")
    )
    people = Person.objects.raw(composed_query, [name])
    return HttpResponse(f"{len(people)} people found with the name {name}.")
