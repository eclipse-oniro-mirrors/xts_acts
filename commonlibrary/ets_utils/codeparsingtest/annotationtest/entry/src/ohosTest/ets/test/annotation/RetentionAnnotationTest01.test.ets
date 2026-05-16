import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Retention, RetentionPolicy } from "@kit.ArkTS"

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

@Retention({policy: RetentionPolicy.SOURCE})
@interface sourceAnno {
  value: number  = 0
  name: string = ''
}

@Retention({policy: RetentionPolicy.BYTECODE})
@interface bytecodeAnno {
  value: number  = 0
  name: string = ''
}

@sourceAnno
function foo() {}

@sourceAnno
namespace ns {}


export default function RetentionAnnotation_01Test() {
  describe('RetentionAnnotation_01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
        await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_RETENTION_ANNOTATION_0100
     * @tc.name      testSourceRetentionAnnotation
     * @tc.desc      Test source retention annotation applied to different scenarios.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSourceRetentionAnnotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSourceRetentionAnnotation';
        console.log(TAG + ' start');
        
        @sourceAnno
        class A{
            @sourceAnno
            private name_ = ''

            @sourceAnno
            get name() {
                return this.name_;
            }
            @sourceAnno
            foo() {}
        }

        @sourceAnno
        let a = 1

        @sourceAnno
        interface iface {
        }

        @sourceAnno
        enum count {
            ONE,
            TWO
        }

        @sourceAnno
        type typeAlias_A = A

        expect(a === 1).assertTrue();
        expect(RetentionPolicy.SOURCE === 'source').assertTrue();
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_RETENTION_ANNOTATION_0200
     * @tc.name      testBytecodeRetentionAnnotation
     * @tc.desc      Test bytecode retention annotation applied to different scenarios.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytecodeRetentionAnnotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testBytecodeRetentionAnnotation';
        console.log(TAG + ' start');
        
        @bytecodeAnno
        class A{
            @bytecodeAnno
            foo() {
                return false;
            }
        }

        expect(new A().foo()).assertFalse();
        expect(RetentionPolicy.BYTECODE === 'bytecode').assertTrue();
      });
  })
}
