import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

export default function ActsCommonEventPublishTest() {
  describe('ActsCommonEventPublishTest', () => {

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Publish001
     * @tc.name      : Verifying Parameters of the  Interface for Create Publish ordered
     * @tc.desc      : Publish Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Publish002
     * @tc.name      : Verifying Parameters of the  Interface for Create Publish unordered
     * @tc.desc      : Publish Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Publish003
     * @tc.name      : Verifying Parameters of the  Interface for nullptr value
     * @tc.desc      : CreatePublishPublishInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_PublishWishInfo001
     * @tc.name      : Verifying Parameters of the  Interface for PublishWithInfo oedered
     * @tc.desc      : PublishWithInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_PublishWishInfo002
     * @tc.name      : Verifying Parameters of the  Interface for PublishWithInfo unoedered
     * @tc.desc      : PublishWithInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_PublishWishInfo003
     * @tc.name      : Verifying Parameters of the  Interface for PublishWithInfo nullptr value
     * @tc.desc      : PublishWithInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_PublishWishInfo004
     * @tc.name      : Verifying Parameters of the  Interface for PublishWithInfo nullptr value
     * @tc.desc      : PublishWithInfo Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo004', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo004()).assertEqual(0)
      done()
    })
  })
}