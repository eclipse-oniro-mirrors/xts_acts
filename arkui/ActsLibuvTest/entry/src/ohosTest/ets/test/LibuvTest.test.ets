/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libuvtest.so';
import hilog from '@ohos.hilog';

const TAG = 'LibuvTest';
const DOMAIN = 0x0201;

export default function LibuvTest() {
  describe('LibuvTestSuite', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'LibuvTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'LibuvTest suite end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_UV_VERSION_0100
     * @tc.name    TestLibuvTestUVVersion
     * @tc.desc    Test UV version, version string, allocator replacement and loop creation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestUVVersion', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUVVersion start');
      
      let result = testNapi.testUVVersion();
      
      hilog.info(DOMAIN, TAG, `Version: ${result.version}, String: ${result.versionString}`);
      
      // 验证版本号存在
      expect(result.version).assertLarger(0);
      
      // 验证版本字符串存在
      expect(result.versionString).assertInstanceOf('String');
      
      // 验证 replace_allocator 返回错误码
      expect(result.replaceAllocatorError).assertEqual(-22); // UV_EINVAL
      
      // 验证 loop 创建成功
      expect(result.loopCreated).assertTrue();
      
      // 验证整体成功
      expect(result.success).assertTrue();
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUVVersion end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_LOOP_0100
     * @tc.name    TestLibuvTestLoop
     * @tc.desc    Test event loop creation and deletion
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestLoop', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestLoop start');
      
      let result = testNapi.testLoop();
      
      expect(result.success).assertTrue();
      expect(result.message).assertEqual('Loop created and deleted successfully');
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestLoop end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_ERR_NAME_0100
     * @tc.name    TestLibuvTestErrName
     * @tc.desc    Test error code to error name conversion
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestErrName', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestErrName start');
      
      let result = testNapi.testErrName();
      
      hilog.info(DOMAIN, TAG, `Error name: ${result.errorName}`);
      
      expect(result.errorName).assertEqual('Unknown system error 0');
      expect(result.success).assertTrue();
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestErrName end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_REQ_GET_DATA_0100
     * @tc.name    TestLibuvTestReqGetData
     * @tc.desc    Test request object data get/set operations
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestReqGetData', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestReqGetData start');
      
      let result = testNapi.testReqGetData();
      
      expect(result.success).assertTrue();
      expect(result.message).assertEqual('Request data operations successful');
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestReqGetData end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_PRINT_HANDLES_0100
     * @tc.name    TestLibuvTestPrintHandles
     * @tc.desc    Test handle printing functionality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestPrintHandles', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestPrintHandles start');
      
      let result = testNapi.testPrintHandles();
      
      expect(result.success).assertTrue();
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestPrintHandles end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_UDP_SEND_QUEUE_0100
     * @tc.name    TestLibuvTestUdpSendQueue
     * @tc.desc    Test UDP send queue size and count operations
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestUdpSendQueue', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUdpSendQueue start');
      
      let result = testNapi.testUdpSendQueue();
      
      expect(result.success).assertTrue();
      expect(result.message).assertEqual('UDP queue operations successful');
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUdpSendQueue end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_FS_LCHOWN_0100
     * @tc.name    TestLibuvTestFsLchown
     * @tc.desc    Test filesystem lchown operation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestFsLchown', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestFsLchown start');
      
      let result = testNapi.testFsLchown();
      
      hilog.info(DOMAIN, TAG, `Lchown return code: ${result.returnCode}`);
      
      // 这个测试预期会失败（路径不存在），但不应该崩溃
      expect(result.success).assertTrue();
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestFsLchown end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_DISABLE_STDIO_INHERITANCE_0100
     * @tc.name    TestLibuvTestDisableStdioInheritance
     * @tc.desc    Test disabling stdio inheritance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestDisableStdioInheritance', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestDisableStdioInheritance start');
      
      let result = testNapi.testDisableStdioInheritance();
      
      expect(result.success).assertTrue();
      expect(result.message).assertEqual('Stdio inheritance disabled');
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestDisableStdioInheritance end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_DLSYM_0100
     * @tc.name    TestLibuvTestDlsym
     * @tc.desc    Test dynamic library loading and symbol lookup
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestDlsym', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestDlsym start');
      
      let result = testNapi.testDlsym();
      
      expect(result.success).assertTrue();
      expect(result.message).assertEqual('Dlsym operations completed');
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestDlsym end');
    });

    /**
     * @tc.number  SUB_ARKUI_LIBUV_UV_ONCE_0100
     * @tc.name    TestLibuvTestUvOnce
     * @tc.desc    Test one-time initialization functionality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('TestLibuvTestUvOnce', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUvOnce start');
      
      let result = testNapi.testUvOnce();
      
      hilog.info(DOMAIN, TAG, `Counter before: ${result.before}, after: ${result.after}`);
      
      expect(result.success).assertTrue();
      expect(result.after).assertLarger(result.before);
      
      hilog.info(DOMAIN, TAG, 'TestLibuvTestUvOnce end');
    });
  });
}
