function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40)
end

function love.update(dt)

end

function love.draw()

    love.graphics.setColor(target.color or {1, 0, 0})
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setFont(gameFont)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(score, 0, 0)

    
end

function love.mousepressed(x, y , button, istouch, presses)
    if button == 1 then
        local m = distance(target.x, target.y, x, y)
        if m <= target.radius then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius) 
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
            target.color = {math.random(), math.random(), math.random()} 
        end
    end
end

function distance (x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end