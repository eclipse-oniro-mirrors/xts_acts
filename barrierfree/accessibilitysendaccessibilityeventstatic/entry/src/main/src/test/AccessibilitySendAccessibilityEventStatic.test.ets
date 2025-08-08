import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'

let domain: number = 0x0000;
let tag: string = 'testTag';
let result: boolean = false;
const bundleName = 'com.sample.testfora11y';
const triggerAction : accessibility.Action = 'accessibilityFocus';
const eventType : accessibility.EventType = 'accessibilityFocus';

export default function abilityTest() {

  describe("AccessibilitySendAccessibilityEvent", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100
    * @tc.desc    The parameter eventType input is accessibilityFocus, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
         */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100');
      let eventType : accessibility.EventType = 'accessibilityFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200
    * @tc.desc    The parameter input eventType is accessibilityFocus, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200',  TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200');
      let eventType : accessibility.EventType = 'accessibilityFocus';

      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300
    * @tc.desc    The parameter eventType input is accessibilityFocusClear, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300');
      let eventType : accessibility.EventType = 'accessibilityFocusClear';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400
    * @tc.desc    The parameter input eventType is accessibilityFocusClear, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400');
      let eventType : accessibility.EventType = 'accessibilityFocusClear';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500
    * @tc.desc    The parameter eventType input is click, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500');
      let eventType : accessibility.EventType = 'click';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0500 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600
    * @tc.desc    The parameter input eventType is click, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600');
      let eventType : accessibility.EventType = 'click';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700
    * @tc.desc    The parameter eventType input is longClick, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700');
      let eventType : accessibility.EventType = 'longClick';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800
    * @tc.desc    The parameter input eventType is longClick, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800');
      let eventType : accessibility.EventType = 'longClick';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900
    * @tc.desc    The parameter eventType input is focus, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900');
      let eventType : accessibility.EventType = 'focus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_0900 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000
    * @tc.desc    The parameter input eventType is focus, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000');
      let eventType : accessibility.EventType = 'focus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100
    * @tc.desc    The parameter eventType input is select, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100');
      let eventType : accessibility.EventType = 'select';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200
    * @tc.desc    The parameter input eventType is select, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200');
      let eventType : accessibility.EventType = 'select';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300
    * @tc.desc    The parameter eventType input is hoverEnter, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300');
      let eventType : accessibility.EventType = 'hoverEnter';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400
    * @tc.desc    The parameter input eventType is hoverEnter, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400');
      let eventType : accessibility.EventType = 'hoverEnter';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500
    * @tc.desc    The parameter eventType input is hoverExit, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500');
      let eventType : accessibility.EventType = 'hoverExit';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1500 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600
    * @tc.desc    The parameter input eventType is hoverExit, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600');
      let eventType : accessibility.EventType = 'hoverExit';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700
    * @tc.desc    The parameter eventType input is textUpdate, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700');
      let eventType : accessibility.EventType = 'textUpdate';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800
    * @tc.desc    The parameter input eventType is textUpdate, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800');
      let eventType : accessibility.EventType = 'textUpdate';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900
    * @tc.desc    The parameter eventType input is textSelectionUpdate, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900');
      let eventType : accessibility.EventType = 'textSelectionUpdate';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_1900 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000
    * @tc.desc    The parameter input eventType is textSelectionUpdate, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000');
      let eventType : accessibility.EventType = 'textSelectionUpdate';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100
    * @tc.desc    The parameter eventType input is scroll, test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100');
      let eventType : accessibility.EventType = 'scroll';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200');
      let windowUpdateType : accessibility.WindowUpdateType = 'add';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.windowUpdateType = windowUpdateType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300');
      let windowUpdateType : accessibility.WindowUpdateType = 'remove';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.windowUpdateType = windowUpdateType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2300 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400');
      let windowUpdateType : accessibility.WindowUpdateType = 'bounds';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.windowUpdateType = windowUpdateType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500');
      let windowUpdateType : accessibility.WindowUpdateType = 'active';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.windowUpdateType = windowUpdateType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2500 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600');
      let windowUpdateType : accessibility.WindowUpdateType = 'focus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.windowUpdateType = windowUpdateType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700');
      let textMoveUnit : accessibility.TextMoveUnit = 'char';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.textMoveUnit = textMoveUnit;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2700 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800');
      let textMoveUnit : accessibility.TextMoveUnit = 'word';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.textMoveUnit = textMoveUnit;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900');
      let textMoveUnit : accessibility.TextMoveUnit = 'line';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.textMoveUnit = textMoveUnit;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_2900 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000');
      let textMoveUnit : accessibility.TextMoveUnit = 'page';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.textMoveUnit = textMoveUnit;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100');
      let textMoveUnit : accessibility.TextMoveUnit = 'paragraph';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.textMoveUnit = textMoveUnit;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3100 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300
    * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300');
      let triggerAction : accessibility.Action = 'accessibilityFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400
    * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400');
      let triggerAction : accessibility.Action = 'accessibilityFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500
    * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500');
      let triggerAction : accessibility.Action = 'clearAccessibilityFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3500 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600
    * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600');
      let triggerAction : accessibility.Action = 'clearAccessibilityFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700
    * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700');
      let triggerAction : accessibility.Action = 'focus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800
    * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800');
      let triggerAction : accessibility.Action = 'focus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900
    * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900');
      let triggerAction : accessibility.Action = 'clearFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_3900 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000
    * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000');
      let triggerAction : accessibility.Action = 'clearFocus';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100
    * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100');
      let triggerAction : accessibility.Action = 'clearSelection';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200
    * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200');
      let triggerAction : accessibility.Action = 'clearSelection';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300
    * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300');
      let triggerAction : accessibility.Action = 'click';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400
    * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400');
      let triggerAction : accessibility.Action = 'click';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500
    * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500');
      let triggerAction : accessibility.Action = 'longClick';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4500 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600
    * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600');
      let triggerAction : accessibility.Action = 'longClick';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700
    * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700');
      let triggerAction : accessibility.Action = 'cut';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800
    * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800');
      let triggerAction : accessibility.Action = 'cut';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900
    * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900');
      let triggerAction : accessibility.Action = 'copy';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_4900 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000
    * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000');
      let triggerAction : accessibility.Action = 'copy';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100
    * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100');
      let triggerAction : accessibility.Action = 'paste';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200
    * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200');
      let triggerAction : accessibility.Action = 'paste';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300
    * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300');
      let triggerAction : accessibility.Action = 'select';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400
    * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400');
      let triggerAction : accessibility.Action = 'select';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500
    * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500');
      let triggerAction : accessibility.Action = 'setText';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5500 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600
    * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600');
      let triggerAction : accessibility.Action = 'setText';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700
    * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700');
      let triggerAction : accessibility.Action = 'delete';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800
    * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800');
      let triggerAction : accessibility.Action = 'delete';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900
    * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900');
      let triggerAction : accessibility.Action = 'scrollForward';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_5900 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000
    * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000');
      let triggerAction : accessibility.Action = 'scrollForward';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6000 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100
    * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100');
      let triggerAction : accessibility.Action = 'scrollBackward';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6100 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200
    * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200');
      let triggerAction : accessibility.Action = 'scrollBackward';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6200 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300');
      let triggerAction : accessibility.Action = 'setSelection';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6300 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400');
      let triggerAction : accessibility.Action = 'setSelection';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500');
      let triggerAction : accessibility.Action = 'setCursorPosition';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6500 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600');
      let triggerAction : accessibility.Action = 'home';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6600 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700');
      let triggerAction : accessibility.Action = 'back';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6700 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800');
      let triggerAction : accessibility.Action = 'recentTask';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6800 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900');
      let triggerAction : accessibility.Action = 'notificationCenter';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_6900 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
    *             function. The result of sendAccessibilityEvent() should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000');
      let triggerAction : accessibility.Action = 'controlCenter';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7000 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100
    * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100');
      let triggerAction : accessibility.Action = 'common';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7100 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200');
      let componentType = 'button';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.componentType = componentType;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7200 has error`);
        expect(null).assertFail();
        done();
      };
    })


    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400');
      let description = 'test';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.description = description;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7400 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500');
      let contents = ['1'];



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.contents = contents;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7500 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600');
      let lastContent = '1';



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.lastContent = lastContent;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_7600 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100
    * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
    *             The function sendAccessibilityEvent in promise mode and result should be undefined.
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100');
      let bundleName1 = "com.example.accessibilitysendaccessibilityevent";



      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.bundleName = bundleName1;
      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8100 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700
    * @tc.desc    The typy of EventInfo is requestFocusForAccessibility, The triggerAction of EventInfo is click ,The elementId of EventInfo is 16  test sendEvent() function
    *             The result of sendEvent() should be equal to a Callback of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700');
      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'click'
      event.customId = '100'

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800
    * @tc.desc    The typy of EventInfo is requestFocusForAccessibility, The triggerAction of EventInfo is click ,The elementId of EventInfo is 16  test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800');
      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'requestFocusForAccessibility'
      event.triggerAction = 'click'
      event.customId = '100'

      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8800 has error`);
        expect(null).assertFail();
        done();
      };
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900
    * @tc.desc    The typy of EventInfo is requestFocusForAccessibility, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendEvent() should be equal to a Callback of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900');
      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'announceForAccessibility'
      event.triggerAction = 'click'
      event.textAnnouncedForAccessibility = 'test123'

      accessibility.sendAccessibilityEvent(event, (err) => {
        hilog.info(domain, tag, "AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900  start ");
        if (err != null && err.code != 0) {
          hilog.error(domain, tag,`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8900 has error`);
          result = false;
        } else {
          hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_8700 has successed`);
          result = true;
        }
        expect(result).assertEqual(true);
        done();
      })
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000
    * @tc.desc    The typy of EventInfo is requestFocusForAccessibility, The triggerAction of EventInfo is click ,The textAnnouncedForAccessibility of EventInfo is test123  test sendEvent() function
    *             The result of sendEvent() should be equal to a promise of undefined
    * @tc.size    MEDIUMTEST
    * @tc.type    User
    * @tc.level   Level 1
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000');
      let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
      event.type = 'announceForAccessibility'
      event.triggerAction = 'click'
      event.textAnnouncedForAccessibility = 'test123'


      try {
        await accessibility.sendAccessibilityEvent(event);
        hilog.info(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000 has successed`);
        done();
      } catch (error) {
        hilog.error(domain, tag, `AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_static_9000 has error`);
        expect(null).assertFail();
        done();
      };
    })

  })
}