import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ttt]'

export default function dragWithOutPPermissionTest() {
  describe('DragWithOutPPermissionTest', () => {
    beforeAll(() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    beforeEach(() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    afterEach(() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    afterAll(() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100', 0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0200', 0, () => {

      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300', 0, () => {
      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        console.info(TAG, `removeAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('201');
      }
    })
  })
}