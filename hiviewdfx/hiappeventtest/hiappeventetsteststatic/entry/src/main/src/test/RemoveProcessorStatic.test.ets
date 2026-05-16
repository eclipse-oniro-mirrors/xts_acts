import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'removeProcessorTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function removeProcessorStrongTest() {
  describe('removeProcessorStrongTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testRemoveProcessor01
     * @tc.number testRemoveProcessor01
     * @tc.desc   验证removeProcessor接口移除数据处理者，processor已存在，删除成功，不存在、非法，删除失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveProcessor01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveProcessor01 start');
      let processor: hiAppEvent.Processor = {
        name: 'ha_app_event',
        routeInfo: 'CN',
      }
      try {
        let processorId = hiAppEvent.addProcessor(processor);
        hilog.info(domain, tag, `testRemoveProcessor01 > processorId: ${processorId}`)
        hiAppEvent.removeProcessor(processorId)
        hiAppEvent.removeProcessor(processorId)
        hiAppEvent.removeProcessor(-1)
        done()
      }
      catch (err) {
        hilog.error(domain, tag, `testRemoveProcessor01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });

  })
  hilog.info(domain, tag, 'removeProcessorTest end');
}