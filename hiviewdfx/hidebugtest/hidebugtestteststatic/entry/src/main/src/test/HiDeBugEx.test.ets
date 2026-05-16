import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import { hilog, hidebug } from '@kit.PerformanceAnalysisKit';
import fileIo from '@ohos.file.fs';

let domain: int = 0x2828; //日志标识,0x2828作为测试框架的业务标识
let tag: string = 'hidebugStrongTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

interface errobj {
  code: int;
  message: string;
}
export default function hidebugStrongTest() {
  describe('hidebugStrongTest', (): void => {
    hilog.info(domain, tag, 'describe start');
    /**
     * @tc.name   HidebugStrongTest_0001
     * @tc.number DFX_DFT_HiviewKit_HidebugStrongTest_0001
     * @tc.desc   验证startJsCpuProfiling接口测试-覆盖第一个参数为空字符串值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugStrongTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "HidebugStrongTest_0001 start");
      try{
        hidebug.startJsCpuProfiling("");
        hilog.info(domain, tag, "====> HidebugStrongTest_0001 startJsCpuProfiling empty ");
        hidebug.stopJsCpuProfiling();
        hilog.info(domain, tag, "====> HidebugStrongTest_0001 startJsCpuProfiling empty end");
        done();
      }catch(error){
        hilog.error(domain, tag, `====>HidebugStrongTest_0001 startJsCpuProfiling catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue();
        done();
      }
    hilog.info(domain, tag, "HidebugStrongTest_0001 end");
    });
    /**
     * @tc.name   HidebugStrongTest_0002
     * @tc.number DFX_DFT_HiviewKit_HidebugStrongTest_0002
     * @tc.desc   验证getServiceDump接口测试-覆盖第一个参数为空字符串值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugStrongTest_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "HidebugStrongTest_0002 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let serviceId: int = 10;
      let args = [""];
      try {
        hidebug.getServiceDump(serviceId, file.fd, args);
        hilog.info(domain, tag, "====> HidebugStrongTest_0002 getServiceDump empty");
        done();
      } catch (error) {
        hilog.info(domain, tag, `====>HidebugStrongTest_0002 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertFalse();
        done();
      }
      hilog.info(domain, tag, "HidebugStrongTest_0002 end");
    });
    /**
     * @tc.name   HidebugStrongTest_0003
     * @tc.number DFX_DFT_HiviewKit_HidebugStrongTest_0003
     * @tc.desc   验证startAppTraceCapture接口测试-覆盖第一个参数为空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugStrongTest_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "HidebugStrongTest_0003 start");
      let flag = hidebug.TraceFlag.ALL_THREADS;
      let limit_size = 1024 * 1024;
      let arr: Array<Long> = [];
      try {
        let path3 = hidebug.startAppTraceCapture(arr, flag, limit_size);
        hilog.info(domain, tag, "====> HidebugStrongTest_0003 startAppTraceCapture null");
        done();
      } catch (error) {
        hilog.info(domain, tag, `====>HidebugStrongTest_0003 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue();
        done();
      }
      hilog.info(domain, tag, "HidebugStrongTest_0003 end");
    });
    /**
     * @tc.name   HidebugStrongTest_0004
     * @tc.number DFX_DFT_HiviewKit_HidebugStrongTest_0004
     * @tc.desc   验证getVMRuntimeStat接口测试-覆盖参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugStrongTest_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "HidebugStrongTest_0004 start");
      try {
        let gcCount = hidebug.getVMRuntimeStat("");
        hilog.info(domain, tag, "====> HidebugStrongTest_0004 getVMRuntimeStat null");
        expect(gcCount === 0).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, `====>HidebugStrongTest_0004 getVMRuntimeStat catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue();
        done();
      }
      hilog.info(domain, tag, "HidebugStrongTest_0004 end");
    });
    /**
     * @tc.name   HidebugTest_0032
     * @tc.number HidebugTest_0032
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,"HidebugTest_0032 start");
      try{
        hidebug.getVMRuntimeStat("");
        hilog.info(domain, tag,"====> HidebugTest_0032 getVMRuntimeStat empty end");
        done();
      }catch(error){
        hilog.error(domain, tag,`====>HidebugTest_0032 getVMRuntimeStat catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue();
        done();
      }
      hilog.info(domain, tag,"HidebugTest_0032 end");
    });
    /**
     * @tc.name   HidebugStrongTest_0005
     * @tc.number DFX_DFT_HiviewKit_HidebugStrongTest_0005
     * @tc.desc   验证enableGwpAsanGrayscale接口测试-第一个参数覆盖参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugStrongTest_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "HidebugStrongTest_0005 start");
      try {
        hidebug.enableGwpAsanGrayscale(undefined, 10);
        hilog.info(domain, tag, "====> HidebugStrongTest_0005 enableGwpAsanGrayscale undefined");
        done();
      } catch (error) {
        hilog.info(domain, tag, `====>HidebugStrongTest_0005 enableGwpAsanGrayscale catch > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue();
        done();
      }
      hilog.info(domain, tag, "HidebugStrongTest_0005 end");
    });
    hilog.info(domain, tag, 'describe end');
  })
}
