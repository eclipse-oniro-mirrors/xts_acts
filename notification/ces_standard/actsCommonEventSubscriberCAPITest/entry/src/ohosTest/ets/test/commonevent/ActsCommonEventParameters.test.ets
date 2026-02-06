import { describe, it, expect, Level } from '@ohos/hypium';
import subscribe from 'libsubscribe.so';

export default function ActsCommonEventParametersTest() {
  describe('ActsCommonEventParametersTest', () => {

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters001
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters001
     * @tc.desc   CreateParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters001', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventCreateParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters002
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters002
     * @tc.desc   DestroyParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters002', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventDestroyParameters001()).assertEqual(0)
      done()
   })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters003
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters003
     * @tc.desc   SetIntToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters003', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters004
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters004
     * @tc.desc   SetIntToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters004', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters005
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters005
     * @tc.desc   SetIntArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters005', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntArrayToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters006
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters006
     * @tc.desc   SetIntArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters006', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetIntArrayToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters007
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters007
     * @tc.desc   SetLongToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters007', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters008
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters008
     * @tc.desc   SetLongToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters008', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters009
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters009
     * @tc.desc   SetLongArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters009', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongArrayToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters010
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters010
     * @tc.desc   SetLongArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters010', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetLongArrayToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters011
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters011
     * @tc.desc   SetDoubleToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters011', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters012
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters012
     * @tc.desc   SetDoubleToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters012', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters013
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters013
     * @tc.desc   SetDoubleToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters013', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters014
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters014
     * @tc.desc   SetDoubleToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters014', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleToParameters004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters015
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters015
     * @tc.desc   SetDoubleArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters015', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters016
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters016
     * @tc.desc   SetDoubleArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters016', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters017
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters017
     * @tc.desc   SetDoubleArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters017', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters018
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters018
     * @tc.desc   SetDoubleArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters018', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetDoubleArrayToParameters004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters019
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters019
     * @tc.desc   SetBoolToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters019', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters020
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters020
     * @tc.desc   SetBoolToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters020', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters021
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters021
     * @tc.desc   SetBoolToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters021', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters022
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters022
     * @tc.desc   SetBoolToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters022', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolToParameters004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters023
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters023
     * @tc.desc   SetBoolArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters023', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters024
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters024
     * @tc.desc   SetBoolArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters024', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters025
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters025
     * @tc.desc   SetBoolArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters025', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters026
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters026
     * @tc.desc   SetBoolArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters026', Level.LEVEL1, async (done: Function) => {
      expect(subscribe.testCommonEventSetBoolArrayToParameters004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters027
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters027
     * @tc.desc   SetCharToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters027', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters028
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters028
     * @tc.desc   SetCharToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters028', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters029
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters029
     * @tc.desc   SetCharToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters029', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters030
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters030
     * @tc.desc   SetCharToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters030', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharToParameters004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters031
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters031
     * @tc.desc   SetCharArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters031', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters032
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters032
     * @tc.desc   SetCharArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters032', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters033
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters033
     * @tc.desc   SetCharArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters033', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Parameters034
     * @tc.number Sub_Notification_Ces_CommonEvent_Parameters034
     * @tc.desc   SetCharArrayToParameters Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Parameters034', Level.LEVEL2, async (done: Function) => {
      expect(subscribe.testCommonEventSetCharArrayToParameters004()).assertEqual(0)
      done()
    })
  })
}