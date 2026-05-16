/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../../hypium/index";
import Utils from '../Util.test';

interface Serializable {
  toJSON(): string;
}

interface NetworkError {
  code: string;
  message: string;
}

interface ErrorDetail {
  code: string;
  message: string;
}
interface User {
    id: string;
    name: string;
    type: 'user';
}
interface System {
    id: string;
    name: string;
    type: 'system';
    version: string;
}
interface LogEntryData {
  action: string;
  target: User | System;
}

interface ValidationError {
  code: number;
  message: string;
  field: string;
}

interface SuccessData {
  status: 'success';
  data: Object;
}

interface ErrorData {
  status: 'error';
  error: ErrorDetail;
}

interface LogEntry {
  timestamp: Date;
  data: LogEntryData;
}

interface BaseError {
  message: string;
  timestamp: Date;
}

interface NetworkDetails {
  code: number;
  url: string;
}

interface NativeObject {
  handle: number;
  metadata: NativeObjectConfig;
}

interface InternalObject {
  id: string;
  name: string;
}

interface NativeObjectConfig {
  type: string;
  path: string;
}

interface ExternalData {
  externalId: string;
  data: number[];
  metadata: null;
}

interface MixedObject {
  internal: InternalObject;
  external: ExternalData;
  processed: number;
  valid: boolean;
}

interface DynamicData {
  dynamicId: string;
  data: DataValue;
}

interface DataValue {
  value: string;
}

interface FormattedData {
  message: string;
}

interface JsonFormatter {
  format(data: Object): string;
}

interface ProcessInput<T> {
  name: string;
  value: T;
}

interface CombinedData<T> {
  input: ProcessInput<T>;
  external: ExternalData;
  processed: boolean;
}

interface ResponseData<T> {
  id: string;
  data: T;
}

type ApiResponseData = SuccessData | ErrorData;

interface SerializerConfig {
  mode: 'strict' | 'lenient';
  rules?: Object;
}

interface SerializedResult {
  config: ConfigResult;
  data: string;
}

interface ConfigResult {
  mode: 'strict' | 'lenient';
}

interface SerializerFn {
  serialize(data: Object): SerializedResult;
}

interface TestObject {
  data: string;

  toJSON(): string;
}

interface TestData {
  message: string;
  visible: string;
  secret: string;
  normal: string;
}

interface ErrorObject {
  error: string;
}

interface TestKeyValue {
  key: string;
}

interface ProcessedValue {
  value: number;
}

interface TestObj {
  test: string;
}

interface SuccessUser {
  user: string;
}

interface GenDataType {
  key: string;
}

type AppError = NetworkError | ValidationError;
type ApiResponse = SuccessData | ErrorData;

interface NetworkErrorWithDetails extends BaseError {
  code: number;
  url: string;
}

interface ErrorInfoData<T> {
  error: string;
  input: ProcessInput<T>;
  timestamp: number;
}

interface SerializerError {
  error: string;
  config: SerializerConfig;
  originalError: Object;
}

function serialize<T>(value: T): string {
  return JSON.stringify(value as Object);
}

function serializeWithToJSON<T extends Serializable>(value: T): string {
  return JSON.stringify(value as Object);
}

function processAndSerialize<T, U>(
  data: T[],
  processor: (item: T) => U
): string {
  const processed = data.map(processor);
  return JSON.stringify(processed);
}

function safeSerialize<T>(value: T): string {
  return JSON.stringify(value as Object);
}

function serializeError(error: AppError): string {
  return JSON.stringify(error as Object);
}

function serializeResponse(response: ApiResponse): string {
  return JSON.stringify(response as Object);
}

function serializeLog(entry: LogEntry): string {
  return JSON.stringify(entry as Object);
}

function serializeNetworkError(error: NetworkErrorWithDetails): string {
  return JSON.stringify(error as Object);
}

function createNativeObject(config: NativeObjectConfig): NativeObject {
  return {
    handle: Math.floor(Math.random() * 1000),
    metadata: config
  };
}

function fromExternal(): ExternalData {
  return {
    externalId: 'ext-123',
    data: [1, 2, 3],
    metadata: null
  };
}

function processExternalData(): string {
  const external = fromExternal();

  if (typeof external === 'object' && external !== null) {
    return JSON.stringify(external);
  }

  const errorObj: ErrorObject = { error: 'Invalid external data' };
  return JSON.stringify(errorObj);
}

function createMixedObject
(internal:
InternalObject, external:
ExternalData
)
:
string
{
  const mixed: MixedObject = {
    internal,
    external,
    processed: Date.now(),
    valid: true
  };

  return JSON.stringify(mixed);
}

function loadAndSerialize(): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      const data: DynamicData = {
        dynamicId: `dyn-${Date.now()}`,
        data: { value: 'dynamic' }
      };
      resolve(JSON.stringify(data));
    }, 100);
  });
}

function serializeWithFormatter(data: FormattedData, formatter: JsonFormatter): string {
  return formatter.format(data as Object);
}

async function serializeResponse<T>(response: ResponseData<T>): Promise<string> {
  return Promise.resolve(JSON.stringify(response as Object));
}

async function processWithGeneric<T>(input: ProcessInput<T>): Promise<string> {
  try {
    const external = fromExternal();

    if (typeof input === 'object' && input !== null) {
      const combined: CombinedData<T> = {
        input: input,
        external: external,
        processed: true
      };
      return Promise.resolve(JSON.stringify(combined));
    }

    throw new Error('Invalid input type');
  } catch (err) {
    const errorInfoData: ErrorInfoData<T> = {
      error: err instanceof Error ? err.message : 'Unknown error',
      input: input as ProcessInput<T>,
      timestamp: Date.now()
    };
    return Promise.resolve(JSON.stringify(errorInfoData));
  }
}

export default function TestJsonStringifyAdvancedScenarios(): void {
  describe('JSON.stringify - Advanced Type Inference Scenarios', (): void => {
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0100
       * @tc.name JsonStringifyAdvancedTest001
       * @tc.desc Test unconstrained generic parameters for various types
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        // 测试各种类型
        const stringResult = serialize<string>("test");
        const numberResult = serialize<number>(42);
        const testObj: TestKeyValue = { key: "value" };
        const objectResult = serialize<TestKeyValue>(testObj);
        const arrayResult = serialize<number[]>([1, 2, 3]);

        expect(typeof stringResult).assertEqual('string');
        expect(typeof numberResult).assertEqual('string');
        expect(objectResult).assertContain('"key":"value"}');
        expect(arrayResult).assertEqual('[1,2,3]');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0300
       * @tc.name JsonStringifyAdvancedTest003
       * @tc.desc Test complex type inference in generics with map function
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest003', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const numbers: number[] = [1, 2, 3];
        const processor = (x: number): ProcessedValue => ({ value: x * 2 });
        const result = processAndSerialize(numbers, processor);

        expect(result).assertContain('"value":2}');
        expect(result).assertContain('"value":4}');
        expect(result).assertContain('"value":6}');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0400
       * @tc.name JsonStringifyAdvancedTest004
       * @tc.desc Test conditional types with JSON.stringify serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest004', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const obj: TestObj = { test: "value" };
        const result = safeSerialize(obj);

        expect(result).assertContain('"test":"value"}');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0500
       * @tc.name JsonStringifyAdvancedTest005
       * @tc.desc Test union types with property conflicts in error serialization
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('JsonStringifyAdvancedTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const networkError: NetworkError = {
          code: 'NETWORK_ERR',
          message: 'Connection failed'
        };

        const validationError: ValidationError = {
          code: 400,
          message: 'Invalid input',
          field: 'email'
        };

        const networkResult = serializeError(networkError);
        const validationResult = serializeError(validationError);

        expect(networkResult).assertContain('"code":"NETWORK_ERR"');
        expect(networkResult).assertContain('"message":"Connection failed"');
        expect(validationResult).assertContain('"code":400');
        expect(validationResult).assertContain('"message":"Invalid input"');
        expect(validationResult).assertContain('"field":"email"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0600
       * @tc.name JsonStringifyAdvancedTest006
       * @tc.desc Test discriminated unions with success/error response types
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('JsonStringifyAdvancedTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const successUser: SuccessUser = { user: 'test' };
        const success: ApiResponse = {
          status: 'success',
          data: successUser
        };

        const error: ApiResponse = {
          status: 'error',
          error: {
            code: 'AUTH_FAILED',
            message: 'Invalid credentials'
          }
        };

        const successResult = serializeResponse(success);
        const errorResult = serializeResponse(error);

        expect(successResult).assertContain('"status":"success"');
        expect(errorResult).assertContain('"status":"error"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0700
       * @tc.name JsonStringifyAdvancedTest007
       * @tc.desc Test nested union types with log entry serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const user: User = {
          id: '123',
          name: 'test',
          type: 'user'
        };
        const logData: LogEntryData = {
          action: 'login',
          target: user
        };
        const logEntry: LogEntry = {
          timestamp: new Date(),
          data: logData
        };

        const result = serializeLog(logEntry);
        expect(result).assertContain('"action":"login"');
        expect(result).assertContain('"type":"user"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0800
       * @tc.name JsonStringifyAdvancedTest008
       * @tc.desc Test intersection types with network error serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const error: NetworkErrorWithDetails = {
          message: 'Network error',
          timestamp: new Date(),
          code: 500,
          url: 'https://example.com'
        };

        const result = serializeNetworkError(error);
        expect(result).assertContain('"message":"Network error"');
        expect(result).assertContain('"code":500');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_0900
       * @tc.name JsonStringifyAdvancedTest009
       * @tc.desc Test opaque native objects serialization
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 1
       */
      it('JsonStringifyAdvancedTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const nativeObj = createNativeObject({
          type: 'file',
          path: '/test/path'
        });

        const result = JSON.stringify(nativeObj);
        expect(result).assertContain('"handle":');
        expect(result).assertContain('"type":"file"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_1000
       * @tc.name JsonStringifyAdvancedTest010
       * @tc.desc Test unknown types from external sources serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const result = processExternalData();
        console.log(result)
        expect(result).assertContain('"externalId":"ext-123"');
        expect(result).assertContain('"data":[1,2,3]');
        expect(result).assertContain('"metadata":null');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_1100
       * @tc.name JsonStringifyAdvancedTest011
       * @tc.desc Test mixed internal and external types serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest011', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const internal: InternalObject = {
          id: 'int-123',
          name: 'Test Object'
        };

        const external: ExternalData = {
          externalId: 'ext-456',
          data: [4, 5, 6],
          metadata: null
        };

        const result = createMixedObject(internal, external);
        expect(result).assertContain('"id":"int-123"');
        expect(result).assertContain('"externalId":"ext-456"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_1200
       * @tc.name JsonStringifyAdvancedTest012
       * @tc.desc Test dynamic import types serialization with async/await
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest012', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
        console.log('JsonStringifyAdvancedTest012 start')
        const result = await loadAndSerialize();
        console.log(result)
        expect(result).assertContain('"dynamicId":');
        expect(result).assertContain('"value":"dynamic"');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_1300
       * @tc.name JsonStringifyAdvancedTest013
       * @tc.desc Test overloaded functions across modules serialization
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest013', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
        const jsonFormatter: JsonFormatter = {
          format: (data: Object): string => JSON.stringify(data)
        };

        const xmlFormatter: JsonFormatter = {
          format: (data: Object): string => `<root>${JSON.stringify(data)}</root>`
        };

        const testData: FormattedData = { message: 'cross-module test' };

        const jsonResult = serializeWithFormatter(testData, jsonFormatter);
        const xmlResult = serializeWithFormatter(testData, xmlFormatter);

        expect(jsonResult).assertContain('"message":"cross-module test"}');
        expect(xmlResult).assertEqual('<root>{"message":"cross-module test"}</root>');
      });

      /**
       * @tc.number SUB_JSON_STRINGIFY_ADVANCED_1400
       * @tc.name JsonStringifyAdvancedTest014
       * @tc.desc Test nested try-catch with generics and external types
       * @tc.size LargeTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('JsonStringifyAdvancedTest014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async (): Promise<void> => {
        // 测试同步
        const syncInput: ProcessInput<string> = { name: 'test', value: 'value' };
        const syncResult = processWithGeneric(syncInput);
        expect(syncResult instanceof Promise).assertTrue();

        // 测试异步
        const asyncInput: ProcessInput<string> = { name: 'async', value: 'value' };
        const asyncResult = await processWithGeneric(asyncInput);
        expect(asyncResult).assertContain('"name":"async"');
        expect(asyncResult).assertContain('"value":"value"');
      });
  });
}
