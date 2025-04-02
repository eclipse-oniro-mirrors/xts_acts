import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';

const TAG = '[ttt]'

export default function dragPerssionNormalTest() {
  describe('DragPerssionNormalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
     let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    beforeEach(async() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
     let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    afterEach(async() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    afterAll(async() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `setAppShareOptions is successed`);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300', 0, () => {

      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DATA_HUB, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0400
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0400', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DATA_HUB, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0500
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0500', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        expect(error.code ).assertEqual('20400001');
      }
    })

    
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0600
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0600', 0, () => {

      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG); 
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })   
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700', 0, () => {

      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DATA_HUB);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0900
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0900', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
/**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000', 0, async(done: Function) => {
      let options = {
        intention: unifiedDataChannel.Intention.DRAG
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 setAppShareOptions is successed`);
        done();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
        done();
      }
      try {
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info(TAG + ` SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 data = ${data}`);
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error(TAG, `Failed to SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 code is ${err.code},message is ${err.message} `);
        expect(err != null).assertFail();
        done();
      });
      }catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code == 401 ).assertTrue();
        done();
      }
      
    })
  })
}