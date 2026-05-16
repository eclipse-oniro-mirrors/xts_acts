import validator from 'validator';

export let npmRes: boolean = validator.isEmail('foo@bar.com');

export { add as hspAdd } from './testAdd';

export { subtract as hspSubtract } from './src/test';

export { multiply as hspMultiply } from './src/test';

export { getInfo as hspGetCNInfo } from './src/test/中文';

export { addTest } from 'loadHar';

export { getHarName } from 'loadHar/src/main/ets/getHarNameTest';

export { addTest as addTest2 } from '@test/library';

export { getHarName as getHarName2 } from '@test/library/src/main/ets/getHarNameTest';

export { add as harAdd } from 'loadHar';

export { subtract as harSubtract } from 'loadHar';

export { multiply as harMultiply } from 'loadHar';

export { testGetCNInfo as harGetCNInfo } from 'loadHar';


