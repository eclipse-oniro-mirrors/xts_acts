
import actsNotificationAnsCoveredTest from './ActsNotificationAnsCoverTest.test'
import actsEmitterTest from'./ActsEmitterTest.test'

export default function testsuite() {
  actsEmitterTest();
  actsNotificationAnsCoveredTest();
}