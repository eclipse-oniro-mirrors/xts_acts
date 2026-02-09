import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: Int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testRegExpPrototypeToString0001haha'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function RegExpTest() {
  describe('regExpTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1700
     * @tc.name testRegExpPrototypeToString0001
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0001";
        try {
          console.log(`${TAG} result:` + new RegExp('a+b+c'));
          hilog.info(domain, '%{public}s', 'abilityTest001 three');
          expect(String(new RegExp('a+b+c'))).assertDeepEquals("/a+b+c/");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1800
     * @tc.name testRegExpPrototypeToString0002
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0002";
        try {
          console.log(`${TAG} result:` + new RegExp('a+b+c').toString());
          expect(new RegExp('a+b+c').toString()).assertEqual("/a+b+c/");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1900
     * @tc.name testRegExpPrototypeToString0003
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0003";
        try {
          console.log(`${TAG} result:` + new RegExp('bar', 'g').toString());
          expect(new RegExp('bar', 'g').toString()).assertEqual("/bar/g");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_2000
     * @tc.name testRegExpPrototypeToString0004
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0004";
        try {
          console.log(`${TAG} result:` + new RegExp('\n', 'g').toString());
          expect(new RegExp('\n', 'g').toString()).assertEqual("/\n/g");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_2100
     * @tc.name testRegExpPrototypeToString0005
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0005";
        try {
          console.log(`${TAG} result:` + new RegExp('\\n', 'g').toString());
          expect(new RegExp('\\n', 'g').toString()).assertEqual("/\\n/g");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_2300
     * @tc.name testRegExpPrototypeToString0007
     * @tc.desc Test the function of the interface RegExpPrototypeToString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeToString0007";
        try {
          console.log(`${TAG} result:` + new RegExp("\n").toString());
          expect(new RegExp("\n").toString()).assertDeepEquals("/\n/");
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1000
     * @tc.name testRegExpPrototypeTest0001
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0001";
        try {
          const str = 'table football';
          const regex = new RegExp('foo*');
          const globalRegex = new RegExp('foo*', 'g');
          expect(String(regex.test(str))).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1100
     * @tc.name testRegExpPrototypeTest0002
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0002";
        try {
          const str = 'table football';
          const regex = new RegExp('foo*');
          const globalRegex = new RegExp('foo*', 'g');
          regex.test(str)
          expect(String(globalRegex.lastIndex)).assertEqual('0');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1200
     * @tc.name testRegExpPrototypeTest0003
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0003";
        try {
          const str = 'table football';
          const regex = new RegExp('foo*');
          const globalRegex = new RegExp('foo*', 'g');
          regex.test(str)
          globalRegex.lastIndex
          expect(String(globalRegex.test(str))).assertEqual('true');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1300
     * @tc.name testRegExpPrototypeTest0004
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0004";
        try {
          const str = 'table football';
          const regex = new RegExp('foo*');
          const globalRegex = new RegExp('foo*', 'g');
          regex.test(str)
          globalRegex.lastIndex
          globalRegex.test(str)
          console.log(`${TAG} result:` + globalRegex.lastIndex)
          expect(String(globalRegex.lastIndex)).assertEqual('9');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1400
     * @tc.name testRegExpPrototypeTest0005
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0005";
        try {
          const str = 'table football';
          const regex = new RegExp('foo*');
          const globalRegex = new RegExp('foo*', 'g');
          regex.test(str)
          globalRegex.lastIndex
          globalRegex.test(str)
          globalRegex.lastIndex
          expect(String(globalRegex.test(str))).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1500
     * @tc.name testRegExpPrototypeTest0006
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0006";
        try {
          const str = "hello world!";
          const regex = new RegExp('^hello');
          expect(String(regex.test(str))).assertEqual('true');
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_REGEXP_1600
     * @tc.name testRegExpPrototypeTest0007
     * @tc.desc Test the function of the interface RegExpPrototypeTest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testRegExpPrototypeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const TAG = "testRegExpPrototypeTest0007";
        try {
          const regex = new RegExp('foo', 'g');
          expect(String(regex.test("foo"))).assertEqual('true')
          expect(String(regex.test("foo"))).assertEqual('false')
          expect(String(regex.test("barfoo"))).assertEqual('true')
          expect(String(regex.test("foobar"))).assertEqual('false')
          expect(String(regex.test("foobarfoo"))).assertEqual('true')
          expect(String(regex.test("foobarfoo"))).assertEqual('true')
          expect(String(regex.test("foobarfoo"))).assertEqual('false');
        } catch (err) {
          err = err as BusinessError;
          console.error(`${TAG} failed, error: ${err.message}`);
          expect(false).assertFail();
        }
      })

  })
}