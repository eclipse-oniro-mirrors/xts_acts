import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

export default function ActsCommonEventPublishTest() {
  describe('ActsCommonEventPublishTest', () => {

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Publish001
     * @tc.number Sub_Notification_Ces_CommonEvent_Publish001
     * @tc.desc   Publish Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Publish002
     * @tc.number Sub_Notification_Ces_CommonEvent_Publish002
     * @tc.desc   Publish Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Publish003
     * @tc.number Sub_Notification_Ces_CommonEvent_Publish003
     * @tc.desc   CreatePublishPublishInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Publish003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublish003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_PublishWishInfo001
     * @tc.number Sub_Notification_Ces_CommonEvent_PublishWishInfo001
     * @tc.desc   PublishWithInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo001', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_PublishWishInfo002
     * @tc.number Sub_Notification_Ces_CommonEvent_PublishWishInfo002
     * @tc.desc   PublishWithInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_PublishWishInfo003
     * @tc.number Sub_Notification_Ces_CommonEvent_PublishWishInfo003
     * @tc.desc   PublishWithInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_PublishWishInfo004
     * @tc.number Sub_Notification_Ces_CommonEvent_PublishWishInfo004
     * @tc.desc   PublishWithInfo Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWishInfo004', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventPublishWithInfo004()).assertEqual(0)
      done()
    })
  })
}