
import 'package:flutter_riverpod/flutter_riverpod.dart';
/**
 * Una de las razones de que a los desarrolladores les guste
 * trabajar con RiverPod, es que introduce muchos pequeños
 * providers que son mas faciles de mantener y de probar.
 * 
 * El state provider  es un proovedor de un estado, este
 * StateProvider es una pequeña pieza de informacion de 
 * estado de nuestra aplicacion
 */
final counterProvider = StateProvider((ref) => 5);