import React, { useState, useEffect } from "react";

const Home = () => {
    const [todos, setTodos] = useState();

    useEffect(() => {
        const url = "/api/todos";
        fetch(url).then((response) => {
            if (response.ok) {
                return response.json();
            }
            throw new Error("Something bad happened...");
        })
        .then((response) => { setTodos(response); }).then(console.log(todos))
    }, []);

    let todo_list = null;
    if(todos){
        todo_list = todos.map((todo, index) => (
            <div key={index}>
                <h2>{todo.task}</h2>
                <p>{todo.description}</p>
            </div>
        ))
    }
    
    return(
        <>
            {todo_list}
        </>
    )
}

export default Home;