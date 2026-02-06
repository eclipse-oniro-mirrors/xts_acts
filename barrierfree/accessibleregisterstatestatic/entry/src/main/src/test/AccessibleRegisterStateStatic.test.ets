import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
    * @tc.desc    on(accessibilityStateChange)
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.on('accessibilityStateChange', callbackdata);
        accessibility.off('accessibilityStateChange', callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
    * @tc.desc    on(touchGuideStateChange)
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.on('touchGuideStateChange', callbackdata);
        accessibility.off('touchGuideStateChange', callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })

    /*
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.desc    on(screenReaderStateChange)
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */

    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.on('screenReaderStateChange', callbackdata);
        accessibility.off('screenReaderStateChange', callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300 failed');
        expect(null).assertFail();
        done();
      }
    })
  })
}