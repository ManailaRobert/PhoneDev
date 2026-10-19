const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

async function uploadPhoto(name: string): Promise<string> {
  await sleep(100);
  if (name.endsWith('.heic')) throw new Error(`unsupported: ${name}`);
  return `uploaded ${name}`;
}

async function settle(p: Promise<string>): Promise<string> {
  try {
    return await p;
  } catch (e) {
    return `failed: ${(e as Error).message}`;
  }
}

const names = ['a.jpg', 'b.heic', 'c.jpg'];
const results = await Promise.all(names.map((n) => settle(uploadPhoto(n))));
for (const r of results) console.log(r);

try {
  await uploadPhoto('d.heic');
} catch (e) {
  console.log(`caught ${(e as Error).message}`);
}