import React, { useState } from "react";

const a = "a".charCodeAt(0),
    z = "z".charCodeAt(0),
    A = "A".charCodeAt(0),
    Z = "Z".charCodeAt(0);

const Main: React.FC = () => {
    const [input, setInput] = useState("Hello world!");
    const handleChange = (event: React.KeyboardEvent<HTMLInputElement>) => {
        setInput(event.target.value);
    };

    const output = [...input]
        .map((c: string) => {
            let i: number = c.charCodeAt(0);
            if (a <= i && i <= z) i = ((i - a + 13) % 26) + a;
            else if (A <= i && i <= Z) i = ((i - A + 13) % 26) + A;
            return String.fromCharCode(i);
        })
        .join("");

    return (
        <>
            <label> Enter string to encode: </label>
            <input value={input} onChange={handleChange} /> <br />
            Encoded string: {output}
        </>
    );
};

export default Main;
