export interface NormalTestObject {
  a: number;
  b: string;
  c: number[];
}

export interface InnerMostTestObject {
  e: number;
}

export interface MiddleTestObject {
  c: number;
  d: InnerMostTestObject;
}

export interface NestedTestObject {
  a: number;
  b: MiddleTestObject;
}

export interface FunctionPropTestObject {
  a: number;
  b: () => void;
}

export interface ArrayBufferTestObject {
  buffer: ArrayBuffer;
}

export interface DataViewTestObject {
  view: DataView;
}

export interface Key2ValueObj {
  a: number;
}

export class ParentTestClass {
  parentProp: number;

  constructor() {
    this.parentProp = 1;
  }
}

export class InheritedTestClass extends ParentTestClass {}

export class NonEnumerableTestClass {
  private a: number;

  constructor() {
    this.a = 1;
  }
}

export class InjectedProtoClass {
  injected: number = 1;
}

export class MiddleProtoClass extends InjectedProtoClass {}

export class PrototypePollutionTestClass extends MiddleProtoClass {}

export class TestClass {
  a: number = 1;
}

export class UndefinedPropertyTestClass {
  a: undefined | number = undefined;
  b: number = 1;
}

export class NullPropertyTestClass {
  a: null | number = null;
  b: number = 1;
}

export class NaNPropertyTestClass {
  a: number = NaN;
  b: number = 1;
}

export class InfinityPropertyTestClass {
  a: number = Infinity;
  b: number = 1;
}

export class TypedArrayTestClass {
  buffer: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
}

export class MapTestClass {
  map: Map<string, string | Key2ValueObj> = new Map<string, string | Key2ValueObj>([
    ['key1', 'value1'],
    ['key2', { a: 1 }]
  ]);
}

export class SetTestClass {
  set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
}

export class PromiseTestClass {
  promise: Promise<string> = new Promise<string>((resolve) => {
    setTimeout(() => resolve('done'), 100);
  });
}

export class RegExpTestClass {
  regex: RegExp = new RegExp('abc', 'gi');
  flags: RegExp = new RegExp('def', 'm');
}