import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ErrorObserver() {
  describe('ErrorObserver', () => {
    /**
     * @tc.name   ErrorObserver
     * @tc.number SUB_ErrorObserver
     * @tc.desc   onUnhandledException函数异常值覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorObserver', Level.LEVEL0, async (done: Function) => {
     let  errorMsg = null;
      let observer: errorManager.ErrorObserver = {
        onUnhandledException(errorMsg) {
          console.error('onUnhandledException, errorMsg: ', errorMsg);
        }
      };

      try {
        errorManager.on('error', observer);
        done();
      } catch (error) {
        console.error(`registerErrorObserver failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   ErrorObserver01
     * @tc.number SUB_ErrorObserver01
     * @tc.desc   onUnhandledException函数异常值覆盖‘ ’；onException函数异常值覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorObserver01', Level.LEVEL2, async (done: Function) => {
      let  errorMsg = ' ';
      let  errorObj = null;
      let observer: errorManager.ErrorObserver = {
        onUnhandledException(errorMsg) {
          console.error('onUnhandledException, errorMsg: ', errorMsg);
        },
        onException(errorObj) {
          console.error('onException, name: ', errorObj.name);
          console.error('onException, message: ', errorObj.message);
          if (typeof (errorObj.stack) === 'string') {
            console.error('onException, stack: ', errorObj.stack);
          }
        }
      };

      try {
        errorManager.on('error', observer);
        done();
      } catch (error) {
        console.error(`registerErrorObserver failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   ErrorObserver02
     * @tc.number SUB_ErrorObserver02
     * @tc.desc   onUnhandledException函数异常值覆盖undefined；onException函数异常值覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorObserver02', Level.LEVEL2, async (done: Function) => {
      let  errorMsg = undefined;
      let  errorObj = undefined;
      let observer: errorManager.ErrorObserver = {
        onUnhandledException(errorMsg) {
          console.error('onUnhandledException, errorMsg: ', errorMsg);
        },
        onException(errorObj) {
          console.error('onException, name: ', errorObj.name);
          console.error('onException, message: ', errorObj.message);
          if (typeof (errorObj.stack) === 'string') {
            console.error('onException, stack: ', errorObj.stack);
          }
        }
      };

      try {
        errorManager.on('error', observer);
        done();
      } catch (error) {
        console.error(`registerErrorObserver failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    })
  })
}