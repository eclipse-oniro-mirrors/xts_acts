import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.desc   onTouchGuideStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onTouchGuideStateChange(callbackdata);
        accessibility.offTouchGuideStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.desc   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onScreenReaderStateChange(callbackdata);
        accessibility.offScreenReaderStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400
     * @tc.desc    getCaptionsManager
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400');
      let captionsStyle: accessibility.CaptionsStyle = {
        fontFamily: "default",
        fontScale: 75,
        fontColor: "#FF000000",
        fontEdgeType: "raised",
        backgroundColor: "#FF000000",
        windowColor: "#FF000000",
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.enabled = true;
        captionsManager.style = captionsStyle;
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0400 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500
     * @tc.desc    onEnableChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500');
      let callbackdata = (data: boolean) => {
        hilog.info(domain, tag, 'on captions state changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.onEnableChange(callbackdata)
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0500 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600
     * @tc.desc    onStyleChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600');
      let callbackdata = (data: accessibility.CaptionsStyle) => {
        hilog.info(domain, tag, 'on captions style changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.onStyleChange(callbackdata)
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0600 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700
     * @tc.desc    offEnableChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700');
      let callbackdata = (data: boolean) => {
        hilog.info(domain, tag, 'on captions state changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.offEnableChange(callbackdata);
        captionsManager.offEnableChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0700 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800
     * @tc.desc    offStyleChange
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800');
      let callbackdata = (data: accessibility.CaptionsStyle) => {
        hilog.info(domain, tag, 'on captions style changed');
      }
      try {
        let captionsManager = accessibility.getCaptionsManager();
        captionsManager.offStyleChange(callbackdata);
        captionsManager.offStyleChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0800 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0900
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0900
     * @tc.desc    The parameter input is 'enableChange', test the onEnableChange() function, and return undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0900');
      let captionsManager: accessibility.CaptionsManager = accessibility.getCaptionsManager();
      let callbackdata = (data: boolean) => {
        hilog.info(domain, tag, 'on captions state changed');
      }
      try {
        captionsManager.onEnableChange(callbackdata);
        captionsManager.offEnableChange(callbackdata);
        captionsManager.offEnableChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0900 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1000
     * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1000
     * @tc.desc    The parameter input is 'styleChange', test the onStyleChange() function, and return undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    User
     * @tc.level   Level 0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1000');
      let captionsManager: accessibility.CaptionsManager = accessibility.getCaptionsManager();
      let callbackdata = (data: accessibility.CaptionsStyle) => {
        hilog.info(domain, tag, 'on captions style changed');
      }
      try {
        captionsManager.onStyleChange(callbackdata);
        captionsManager.offStyleChange(callbackdata);
        captionsManager.offStyleChange();
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_1000 failed');
        expect(null).assertFail();
        done();
      }
    })








  })
}