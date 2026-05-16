/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

export interface TestResult {
  success: boolean;
  message?: string;
  code?: number;
}

export interface VersionResult extends TestResult {
  version?: number;
  versionString?: string;
  replaceAllocatorError?: number;
  loopCreated?: boolean;
}

export interface ErrNameResult extends TestResult {
  errorName?: string;
}

export interface OnceResult extends TestResult {
  before?: number;
  after?: number;
}

export interface FsLchownResult extends TestResult {
  returnCode?: number;
}

export const testUVVersion: () => VersionResult;
export const testLoop: () => TestResult;
export const testErrName: () => ErrNameResult;
export const testReqGetData: () => TestResult;
export const testPrintHandles: () => TestResult;
export const testUdpSendQueue: () => TestResult;
export const testFsLchown: () => FsLchownResult;
export const testDisableStdioInheritance: () => TestResult;
export const testDlsym: () => TestResult;
export const testUvOnce: () => OnceResult;
