import 'package:test/test.dart';
import 'package:vice_ser_oeg/domain/resources/app_resources.dart';
import 'package:vice_ser_oeg/ui/components/app_text_field/app_text_field_validators.dart';

void main() {
  group('Common Validator Tests', () {
    const emptyString = "";
    const notDobleValue = "gf234sdfg";
    const doubleValue = "55.56876";
    test('if empty string', () {
      expect(AppResources.stringRequiredFill, commonValidator(emptyString));
    });
    test('if not double value ', () {
      expect(AppResources.stringRequiredDouble, commonValidator(notDobleValue));
    });
    test('if not empty and double ', () {
      expect(null, commonValidator(doubleValue));
    });
  });
}
