import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

export default function ActsCommonEventParametersTest() {
  describe('ActsCommonEventParametersTest', () => {

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters001
     * @tc.name      : Verifying Parameters of the  Interface for Create PublishInfo .
     * @tc.desc      : CreateParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters001', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventCreateParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters002
     * @tc.name      : Destroy a PublishInfo Through the  Interface
     * @tc.desc      : DestroyParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventDestroyParameters001()).assertEqual(0)
      done()
   })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters003
     * @tc.name      : SetIntToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetIntToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters004
     * @tc.name      : SetIntToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetIntToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters004', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters005
     * @tc.name      : SetIntArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetIntArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters005', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntArrayToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters006
     * @tc.name      : SetIntArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetIntArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters006', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntArrayToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters007
     * @tc.name      : SetLongToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetLongToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters007', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters008
     * @tc.name      : SetLongToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetLongToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters008', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters009
     * @tc.name      : SetLongArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetLongArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters009', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongArrayToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters010
     * @tc.name      : SetLongArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetLongArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters010', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongArrayToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters011
     * @tc.name      : SetDoubleToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetDoubleToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters011', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters012
     * @tc.name      : SetDoubleToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters012', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters013
     * @tc.name      : SetDoubleToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters013', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters014
     * @tc.name      : SetDoubleToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters014', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters015
     * @tc.name      : SetDoubleArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetDoubleArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters015', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters016
     * @tc.name      : SetDoubleArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters016', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters017
     * @tc.name      : SetDoubleArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters017', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters018
     * @tc.name      : SetDoubleArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetDoubleArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters018', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters019
     * @tc.name      : SetBoolToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetBoolToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters019', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters020
     * @tc.name      : SetBoolToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetBoolToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters020', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters021
     * @tc.name      : SetBoolToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetBoolToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters021', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters022
     * @tc.name      : SetBoolToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetBoolToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters022', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters023
     * @tc.name      : SetBoolArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetBoolArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters023', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters024
     * @tc.name      : SetBoolArrayToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetBoolArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters024', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters025
     * @tc.name      : SetBoolArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetBoolArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters025', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters026
     * @tc.name      : SetBoolArrayToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetBoolArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters026', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters027
     * @tc.name      : SetCharToParameters a PublishInfo Through the  Interface with valid value
     * @tc.desc      : SetCharToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters027', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters028
     * @tc.name      : SetCharToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetCharToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters028', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters029
     * @tc.name      : SetCharToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetCharToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters029', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters030
     * @tc.name      : SetCharToParameters a PublishInfo Through the  Interface with null value
     * @tc.desc      : SetCharToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters030', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters031
     * @tc.name      : SetCharArrayToParameters a PublishInfo Through the  Interface with valid parameters
     * @tc.desc      : SetCharArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters031', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters032
     * @tc.name      : SetCharArrayToParameters a PublishInfo Through the  Interface with nullptr value
     * @tc.desc      : SetCharArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters032', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters033
     * @tc.name      : SetCharArrayToParameters a PublishInfo Through the  Interface with valid parameters
     * @tc.desc      : SetCharArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters033', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Parameters034
     * @tc.name      : SetCharArrayToParameters a PublishInfo Through the  Interface with valid parameters
     * @tc.desc      : SetCharArrayToParameters Interface parameter verification
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters034', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters004()).assertEqual(0)
      done()
    })
  })
}