import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function ActsCommonEventPublishinfoTest() {
  describe('ActsCommonEventPublishinfoTest', () => {

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0001
     * @tc.number Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0001
     * @tc.desc   CreatePublishInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0001', Level.LEVEL0, async (done: Function) => {
      expect(subscribe.testCommonEventCreatePublishInfo001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0002
     * @tc.number Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0002
     * @tc.desc   CreatePublishInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventCreatePublishInfo002()).assertEqual(0)
      done()
   })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_DestoryPublishInfo_0001
     * @tc.number Sub_Notification_Ces_CommonEvent_DestoryPublishInfo_0001
     * @tc.desc   DestroyPublishInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_DestoryPublishInfo_0001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventDestroyPublishInfo001()).assertEqual(0)
      done()
   })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName001
     * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName001
     * @tc.desc   SetPublishInfoBundleName Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName001', Level.LEVEL0, async (done: Function) => {
      expect(subscribe.testCommonEventSetPublishInfoBundleName001()).assertEqual(0)
      done()
   })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName002
     * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName002
     * @tc.desc   SetPublishInfoBundleName Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetPublishInfoBundleName002()).assertEqual(0)
      done()
   })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName003
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName003
       * @tc.desc   SetPublishInfoBundleName Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoBundleName003()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions001
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions001
       * @tc.desc   SetPublishInfoPermissions Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions001', Level.LEVEL0, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions001()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions002
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions002
       * @tc.desc   SetPublishInfoPermissions Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions002()).assertEqual(0)
        done()
    })
    
      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions003
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions003
       * @tc.desc   SetPublishInfoPermissions Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions003()).assertEqual(0)
        done()
    })
    
      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoCode001
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoCode001
       * @tc.desc   SetPublishInfoCode Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCode001', Level.LEVEL0, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoCode001()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoCode002
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoCode002
       * @tc.desc   SetPublishInfoCode Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCode002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoCode002()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData001
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData001
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData001', Level.LEVEL1, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData001()
        await sleep(2000)
        expect(subscribe.getDataStr001()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData002
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData002
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData002', Level.LEVEL2, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData002()
        await sleep(2000)
        expect(subscribe.getDataStr002()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData003
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData003
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData003', Level.LEVEL2, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData003()
        await sleep(2000)
        expect(subscribe.getDataStr003()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData004
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData004
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData004', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData004()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData005
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData005
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData005', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData005()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoData006
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoData006
       * @tc.desc   SetPublishInfoData Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData006', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData006()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters001
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters001
       * @tc.desc   SetPublishInfoParameters Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters001', Level.LEVEL1, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters001()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters002
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters002
       * @tc.desc   SetPublishInfoParameters Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters002()).assertEqual(0)
        done()
    })

      /**
       * @tc.name   Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters003
       * @tc.number Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters003
       * @tc.desc   SetPublishInfoParameters Interface parameter verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters003()).assertEqual(0)
        done()
    })
  })
}  