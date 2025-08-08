import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function ActsCommonEventPublishinfoTest() {
  describe('ActsCommonEventPublishinfoTest', () => {

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0001
     * @tc.name      : Verifying Parameters of the  Interface for Create PublishInfo .
     * @tc.desc      : CreatePublishInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0001', Level.LEVEL0, async (done: Function) => {
      expect(subscribe.testCommonEventCreatePublishInfo001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0002
     * @tc.name      : Creating a PublishInfo Through the  Interface
     * @tc.desc      : CreatePublishInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_CreatePublishInfo_0002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventCreatePublishInfo002()).assertEqual(0)
      done()
   })

   /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_DestoryPublishInfo_0001
     * @tc.name      : Destroy a PublishInfo Through the  Interface
     * @tc.desc      : DestroyPublishInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_DestoryPublishInfo_0001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventDestroyPublishInfo001()).assertEqual(0)
      done()
   })

   /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName001
     * @tc.name      : SetPublishInfoBundleName Through the  Interface
     * @tc.desc      : SetPublishInfoBundleName Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName001', Level.LEVEL0, async (done: Function) => {
      expect(subscribe.testCommonEventSetPublishInfoBundleName001()).assertEqual(0)
      done()
   })

   /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName002
     * @tc.name      : SetPublishInfoBundleName Through the  Interface with nullptr value
     * @tc.desc      : SetPublishInfoBundleName Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetPublishInfoBundleName002()).assertEqual(0)
      done()
   })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName003
      * @tc.name      : SetPublishInfoBundleName Through the  Interface
      * @tc.desc      : SetPublishInfoBundleName Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoBundleName003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoBundleName003()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions001
      * @tc.name      : SetPublishInfoPermissions Through the  Interface
      * @tc.desc      : SetPublishInfoPermissions Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions001', Level.LEVEL0, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions001()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions002
      * @tc.name      : SetPublishInfoPermissions Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoPermissions Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions002()).assertEqual(0)
        done()
    })
    
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions003
      * @tc.name      : SetPublishInfoPermissions Through the  Interface
      * @tc.desc      : SetPublishInfoPermissions Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissions003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoPermissions003()).assertEqual(0)
        done()
    })
    
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoCode001
      * @tc.name      : SetPublishInfoCode Through the  Interface
      * @tc.desc      : SetPublishInfoCode Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCode001', Level.LEVEL0, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoCode001()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoCode002
      * @tc.name      : SetPublishInfoCode Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoCode Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCode002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoCode002()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData001
      * @tc.name      : SetPublishInfoData Through the  Interface
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 1
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData001', Level.LEVEL1, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData001()
        await sleep(2000)
        expect(subscribe.getDataStr001()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData002
      * @tc.name      : SetPublishInfoData Through the  Interface with valid value
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData002', Level.LEVEL2, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData002()
        await sleep(2000)
        expect(subscribe.getDataStr002()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData003
      * @tc.name      : SetPublishInfoData Through the  Interface valid value
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData003', Level.LEVEL2, async (done: Function) => {
        subscribe.testCommonEventSetPublishInfoData003()
        await sleep(2000)
        expect(subscribe.getDataStr003()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData004
      * @tc.name      : SetPublishInfoData Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData004', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData004()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData005
      * @tc.name      : SetPublishInfoData Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData005', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData005()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoData006
      * @tc.name      : SetPublishInfoData Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoData Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoData006', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoData006()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters001
      * @tc.name      : SetPublishInfoParameters Through the  Interface
      * @tc.desc      : SetPublishInfoParameters Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 1
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters001', Level.LEVEL1, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters001()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters002
      * @tc.name      : SetPublishInfoParameters Through the  Interface with nullptr value
      * @tc.desc      : SetPublishInfoParameters Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters002', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters002()).assertEqual(0)
        done()
    })

    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters003
      * @tc.name      : SetPublishInfoParameters Through the  Interface with valid value
      * @tc.desc      : SetPublishInfoParameters Interface parameter verification
      * @tc.size      : Medium-sized Test
      * @tc.type      : Function test
      * @tc.level     : Level 2
      */
      it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameters003', Level.LEVEL2, async (done: Function) => {
        expect(subscribe.testCommonEventSetPublishInfoParameters003()).assertEqual(0)
        done()
    })
  })
}  