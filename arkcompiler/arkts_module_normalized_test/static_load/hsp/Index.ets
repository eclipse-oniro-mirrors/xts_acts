import validator from 'validator';

export let npmRes: boolean = validator.isEmail('foo@bar.com');

export { add as hspAdd } from './testAdd';

export { subtract as hspSubtract } from './src/test/TestSubtract.test';

export { multiply as hspMultiply } from './src/test/Index.test';

export { getInfo as hspGetCNInfo } from './src/test/Chinese.test';

export { addTest } from 'loadHar';

export { getHarName } from 'loadHar/src/main/ets/GetHarNameTest.test';

export { addTest as addTest2 } from 'library';

export { getHarName as getHarName2 } from 'library/src/main/ets/GetHarNameTest.test';

export { add as harAdd } from 'loadHar';

export { subtract as harSubtract } from 'loadHar';

export { multiply as harMultiply } from 'loadHar';

export { testGetCNInfo as harGetCNInfo } from 'loadHar';


