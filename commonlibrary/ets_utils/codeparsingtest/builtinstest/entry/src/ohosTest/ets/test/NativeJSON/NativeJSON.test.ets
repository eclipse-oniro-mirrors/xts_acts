/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function NativeJsonTest() {
  describe('NativeJsonTest', () => {
    beforeAll(() => {

    })

    beforeEach(() => {

    })

    afterAll(() => {

    })
    afterEach(() => {

    })

    let init: (size: number) => string = (size: number): string => {
      let ans = '[';
      while (ans.length < size) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}]';
      return ans;
    }

    interface text1 {
      big: number;
      small: number;
      deci: number;
      shortExp: number;
      longExp: number;
      less1: number;
      less2: number;
      less3: number;
      less4: number;
      greater1: number;
      greater2: number;
      greater3: number;
      greater4: number;
      equal1: number;
      equal2: number;
    }

    let reviverFunc1: (key: string, value: Object) => Object = (key: string, value: Object): Object => {
      return value
    }

    let reviverFunc2: (key: string, value: Object) => Object = (key: string, value: Object): Object => {
      if (key === 'big') {
        return value = 1122334455667788;
      }
      if (key === 'small') {
        return value = 1122334455667788;
      }
      if (key === 'deci') {
        return value = 1122334455667788;
      }
      if (key === 'shortExp') {
        return value = 1122334455667788;
      }
      if (key === 'longExp') {
        return value = 1122334455667788;
      }
      return value
    }

    let reviverFunc3: (key: string, value: Object) => Object = (key: string, value: Object): Object => {
      if (key === 'big') {
        return value = 1122334455667788;
      }
      if (key === 'small') {
        return value = 1122334455667788999;
      }
      if (key === 'deci') {
        return value = 1122334455667788999;
      }
      if (key === 'shortExp') {
        return value = 1122334455667788999;
      }
      if (key === 'longExp') {
        return value = 1122334455667788999;
      }
      return value
    }

    let jsonText1 =
      '{"big":1122334455667788999,"small":123,"deci":1234567890.0123456,"shortExp":1.79e+308,"longExp":1.7976931348623157e+308}'

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_JSON_PARSE_0100
     * @tc.name       : testNativeJsonParse0001
     * @tc.desc       : Test the JSON.parse() function with multiple scenarios.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeJsonParse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNativeJsonParse0001";
      try {
        let obj1 = JSON.parse(jsonText1, undefined) as text1;
        expect(obj1.big + '>' + typeof obj1.big).assertEqual('1122334455667789000>number');
        expect(obj1.small + '>' + typeof obj1.small).assertEqual('123>number');
        expect(obj1.deci + '>' + typeof obj1.deci).assertEqual('1234567890.0123456>number');
        expect(obj1.shortExp + '>' + typeof obj1.shortExp).assertEqual('1.79e+308>number');
        expect(obj1.longExp + '>' + typeof obj1.longExp).assertEqual('1.7976931348623157e+308>number');

        let obj2 = JSON.parse(jsonText1) as text1;
        expect(obj2.big + '>' + typeof obj2.big).assertEqual('1122334455667789000>number');
        expect(obj2.small + '>' + typeof obj2.small).assertEqual('123>number');
        expect(obj2.deci + '>' + typeof obj2.deci).assertEqual('1234567890.0123456>number');
        expect(obj2.shortExp + '>' + typeof obj2.shortExp).assertEqual('1.79e+308>number');
        expect(obj2.longExp + '>' + typeof obj2.longExp).assertEqual('1.7976931348623157e+308>number');

        let obj3 = JSON.parse(jsonText1, reviverFunc2) as text1;
        expect(obj3.big + '>' + typeof obj3.big).assertEqual('1122334455667788>number');
        expect(obj3.small + '>' + typeof obj3.small).assertEqual('1122334455667788>number');
        expect(obj3.deci + '>' + typeof obj3.deci).assertEqual('1122334455667788>number');
        expect(obj3.shortExp + '>' + typeof obj3.shortExp).assertEqual('1122334455667788>number');
        expect(obj3.longExp + '>' + typeof obj3.longExp).assertEqual('1122334455667788>number');

        let obj4 = JSON.parse(jsonText1, reviverFunc3) as text1;
        expect(obj4.big + '>' + typeof obj4.big).assertEqual('1122334455667788>number');
        expect(obj4.small + '>' + typeof obj4.small).assertEqual('1122334455667789000>number');
        expect(obj4.deci + '>' + typeof obj4.deci).assertEqual('1122334455667789000>number');
        expect(obj4.shortExp + '>' + typeof obj4.shortExp).assertEqual('1122334455667789000>number');
        expect(obj4.longExp + '>' + typeof obj4.longExp).assertEqual('1122334455667789000>number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_JSON_BIGINT_0100
     * @tc.name       : testNativeJsonBigIntMode0001
     * @tc.desc       : Test the JSON.parse() function with BigInt handling.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeJsonBigIntMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNativeJsonBigIntMode0001";
      try {
        let jsonText2 =
          '{"less1":9007199254740991,"greater1":9007199254740993,"equal1":9007199254740992,"less2":-9007199254740993,"greater2":-9007199254740991,"equal2":-9007199254740992,"less3":9007199254740991.999,"greater3":9007199254740992.001,"less4":-9007199254740992.001,"greater4":-9007199254740991.999}';
        let obj1 = JSON.parse(jsonText2, reviverFunc1) as text1;
        expect(obj1.less1 + '>' + typeof obj1.less1).assertEqual('9007199254740991>number');
        expect(obj1.less3 + '>' + typeof obj1.less3).assertEqual('9007199254740992>number');
        expect(obj1.greater1 + '>' + typeof obj1.greater1).assertEqual('9007199254740992>number');
        expect(obj1.greater3 + '>' + typeof obj1.greater1).assertEqual('9007199254740992>number');
        expect(obj1.equal1 + '>' + typeof obj1.equal1).assertEqual('9007199254740992>number');
        expect(obj1.less2 + '>' + typeof obj1.less2).assertEqual('-9007199254740992>number');
        expect(obj1.less4 + '>' + typeof obj1.less4).assertEqual('-9007199254740992>number');
        expect(obj1.greater2 + '>' + typeof obj1.greater2).assertEqual('-9007199254740991>number');
        expect(obj1.greater4 + '>' + typeof obj1.greater4).assertEqual('-9007199254740992>number');
        expect(obj1.equal2 + '>' + typeof obj1.equal2).assertEqual('-9007199254740992>number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_JSON_STRINGIFY_0100
     * @tc.name       : testNativeJsonStringify0001
     * @tc.desc       : Test the JSON.stringify() function with multiple scenarios.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testNativeJsonStringify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNativeJsonStringify0001";
      try {
        let jsonText1 =
          '{"person":{"name":"JohnDoe","age":30,"gender":"male","address":{"street":"123MainSt","city":"Anytown","state":"CA","zip":"12345"},"phone_numbers":[{"type":"home","number":"555-555-1234"},{"type":"work","number":"555-555-5678"},{"type":"mobile","number":"555-555-9012"}],"email_addresses":[{"type":"personal","address":"john.doe@gmail.com"},{"type":"work","address":"jdoe@acme.com"}],"job_history":[{"company":"AcmeInc","title":"SoftwareEngineer","start_date":"2010-01-01","end_date":"2015-12-31","responsibilities":["Developedandmaintainedcompany\'sflagshipproduct","Managedatemof10developers"]},{"company":"XYZCorp.","title":"SeniorSoftwareEngineer","start_date":"2016-01-01","end_date":null,"responsibilities":["Designedandimplementednewfeaturesforcompany\'splatform","Mentoredjuniordevelopers"]}]},"company":{"name":"AcmeInc.","address":{"street":"456MainSt","city":"Anytown","state":"CA","zip":"12345"},"phone_number":[{"type":"main","number":"555-555-6789"},{"type":"fax","number":"555-555-4321"}],"email_addresses":[{"type":"general","address":"info@acme.com"},{"type":"support","address":"support@acme.com"}],"departments":[{"name":"Engineering","employees":[{"name":"JaneSmith","title":"LeadEngineer","phone_number":"555-555-5555","email_address":"jane.smith@acme.com"},{"name":"BobJohnson","title":"SoftwareEngineer","phone_number":"555-555-5556","email_address":"bob.johnson@acme,com"}]},{"name":"Sales","employees":[{"name":"SallyJones","title":"SaleManager","phone_number":"555-555-5557","email_address":"sally.jones@acme.com"},{"name":"TomWilliams","title":"SalesRepresentative","phone_number":"555-555-5558","email_address":"tom.williams@acme.com"}]}]}}';
        let obj1 = JSON.parse(jsonText1) as text1;
        expect(JSON.stringify(obj1))
          .assertEqual("{\"person\":{\"name\":\"JohnDoe\",\"age\":30,\"gender\":\"male\",\"address\":{\"street\":\"123MainSt\",\"city\":\"Anytown\",\"state\":\"CA\",\"zip\":\"12345\"},\"phone_numbers\":[{\"type\":\"home\",\"number\":\"555-555-1234\"},{\"type\":\"work\",\"number\":\"555-555-5678\"},{\"type\":\"mobile\",\"number\":\"555-555-9012\"}],\"email_addresses\":[{\"type\":\"personal\",\"address\":\"john.doe@gmail.com\"},{\"type\":\"work\",\"address\":\"jdoe@acme.com\"}],\"job_history\":[{\"company\":\"AcmeInc\",\"title\":\"SoftwareEngineer\",\"start_date\":\"2010-01-01\",\"end_date\":\"2015-12-31\",\"responsibilities\":[\"Developedandmaintainedcompany'sflagshipproduct\",\"Managedatemof10developers\"]},{\"company\":\"XYZCorp.\",\"title\":\"SeniorSoftwareEngineer\",\"start_date\":\"2016-01-01\",\"end_date\":null,\"responsibilities\":[\"Designedandimplementednewfeaturesforcompany'splatform\",\"Mentoredjuniordevelopers\"]}]},\"company\":{\"name\":\"AcmeInc.\",\"address\":{\"street\":\"456MainSt\",\"city\":\"Anytown\",\"state\":\"CA\",\"zip\":\"12345\"},\"phone_number\":[{\"type\":\"main\",\"number\":\"555-555-6789\"},{\"type\":\"fax\",\"number\":\"555-555-4321\"}],\"email_addresses\":[{\"type\":\"general\",\"address\":\"info@acme.com\"},{\"type\":\"support\",\"address\":\"support@acme.com\"}],\"departments\":[{\"name\":\"Engineering\",\"employees\":[{\"name\":\"JaneSmith\",\"title\":\"LeadEngineer\",\"phone_number\":\"555-555-5555\",\"email_address\":\"jane.smith@acme.com\"},{\"name\":\"BobJohnson\",\"title\":\"SoftwareEngineer\",\"phone_number\":\"555-555-5556\",\"email_address\":\"bob.johnson@acme,com\"}]},{\"name\":\"Sales\",\"employees\":[{\"name\":\"SallyJones\",\"title\":\"SaleManager\",\"phone_number\":\"555-555-5557\",\"email_address\":\"sally.jones@acme.com\"},{\"name\":\"TomWilliams\",\"title\":\"SalesRepresentative\",\"phone_number\":\"555-555-5558\",\"email_address\":\"tom.williams@acme.com\"}]}]}}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}