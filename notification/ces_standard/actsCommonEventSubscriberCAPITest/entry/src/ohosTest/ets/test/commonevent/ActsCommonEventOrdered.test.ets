import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function ActsCommonEventOrderedTest() {
  describe('ActsCommonEventOrderedTest', () => {

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Isorderedcommonevent001
     * @tc.name      : Verifying Parameters of the  Interface for IsOrderedCommonEvent.
     * @tc.desc      : IsOrderedCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Isorderedcommonevent001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventIsOrderedCommonEvent001()
      await sleep(2000)
      expect(subscribe.getIsOrdered001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Isorderedcommonevent002
     * @tc.name      : Verifying Parameters of the  Interface for IsOrderedCommonEvent.
     * @tc.desc      : IsOrderedCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Isorderedcommonevent002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventIsOrderedCommonEvent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_FinishCommonEvent001
     * @tc.name      : Verifying Parameters of the  Interface for FinishCommonEvent.
     * @tc.desc      : FinishCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_FinishCommonEvent001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventFinishCommonEvent001()
      await sleep(2000)
      expect(subscribe.getIsFinished001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_FinishCommonEvent002
     * @tc.name      : Verifying Parameters of the  Interface for FinishCommonEvent.
     * @tc.desc      : FinishCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_FinishCommonEvent002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventFinishCommonEvent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_AbortCommonEvent001
     * @tc.name      : Verifying Parameters of the  Interface for AbortCommonEvent.
     * @tc.desc      : AbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_AbortCommonEvent001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventAbortCommonEvent001()
      await sleep(2000)
      expect(subscribe.getIsAborted001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_AbortCommonEvent002
     * @tc.name      : Verifying Parameters of the  Interface for AbortCommonEvent.
     * @tc.desc      : AbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_AbortCommonEvent002',Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventAbortCommonEvent002()).assertEqual(0)
      done()
    })

     /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetAbortCommonEvent001
     * @tc.name      : Verifying Parameters of the  Interface for AbortCommonEvent.
     * @tc.desc      : AbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetAbortCommonEvent001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventGetAbortCommonEvent001()
      await sleep(2000)
      expect(subscribe.getIsGetAborted001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetAbortCommonEvent002
     * @tc.name      : Verifying Parameters of the  Interface for AbortCommonEvent.
     * @tc.desc      : AbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetAbortCommonEvent002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventGetAbortCommonEvent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_ClearAbortCommonEvent001
     * @tc.name      : Verifying Parameters of the  Interface for ClearAbortCommonEvent.
     * @tc.desc      : ClearAbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_ClearAbortCommonEvent001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventClearAbortCommonEvent001()
      await sleep(2000)
      expect(subscribe.getIsClearAborted001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_ClearAbortCommonEvent002
     * @tc.name      : Verifying Parameters of the  Interface for ClearAbortCommonEvent.
     * @tc.desc      : ClearAbortCommonEvent Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_ClearAbortCommonEvent002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventClearAbortCommonEvent002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber001
     * @tc.name      : Verifying Parameters of the  Interface for SetCodeToSubscriber.
     * @tc.desc      : SetCodeToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventSetCodeToSubscriber001()
      await sleep(2000)
      console.log("cesTest "+subscribe.getCode001())
      expect(subscribe.getCode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber002
     * @tc.name      : Verifying Parameters of the  Interface for SetCodeToSubscriber.
     * @tc.desc      : SetCodeToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCodeToSubscriber002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber003
     * @tc.name      : Verifying Parameters of the  Interface for SetCodeToSubscriber with nullptr value.
     * @tc.desc      : SetCodeToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetCodeToSubscriber003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCodeToSubscriber003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetCodeFromSubscriber001
     * @tc.name      : Verifying Parameters of the  Interface for GetCodeFromSubscriber.
     * @tc.desc      : GetCodeFromSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetCodeFromSubscriber001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventGetCodeFromSubscriber001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetCodeFromSubscriber002
     * @tc.name      : Verifying Parameters of the  Interface for GetCodeFromSubscriber.
     * @tc.desc      : GetCodeFromSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetCodeFromSubscriber002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventGetCodeFromSubscriber002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetDataToSubscriber001
     * @tc.name      : Verifying Parameters of the  Interface for SetDataToSubscriber.
     * @tc.desc      : SetDataToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetDataToSubscriber001', Level.LEVEL2, async (done: Function) => {
      subscribe.testCommonEventSetDataToSubscriber001()
      await sleep(2000)
      expect(subscribe.getData001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetDataToSubscriber002
     * @tc.name      : Verifying Parameters of the  Interface for SetDataToSubscriber.
     * @tc.desc      : SetDataToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetDataToSubscriber002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDataToSubscriber002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_SetDataToSubscriber003
     * @tc.name      : Verifying Parameters of the  Interface for SetDataToSubscriber.
     * @tc.desc      : SetDataToSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_SetDataToSubscriber003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDataToSubscriber003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetDataFromSubscriber001
     * @tc.name      : Verifying Parameters of the  Interface for GetDataFromSubscriber.
     * @tc.desc      : GetDataFromSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetDataFromSubscriber001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventGetDataFromSubscriber001()).assertEqual(0)
      await sleep(2000)
      expect(subscribe.getData002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_GetDataFromSubscriber002
     * @tc.name      : Verifying Parameters of the  Interface for GetDataFromSubscriber.
     * @tc.desc      : GetDataFromSubscriber Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_GetDataFromSubscriber002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventGetDataFromSubscriber002()).assertEqual(0)
      done()
    })
  })
}